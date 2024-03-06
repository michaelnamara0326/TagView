//
//  FlexibleView.swift
//
//
//  Created by Michael Shen[沈柏帆] on 2024/3/6.
//

import SwiftUI

protocol FlexibleViewDelegate {
    func totalOfRow(row: Int)
}

/// Facade of our view, its main responsibility is to get the available width
/// and pass it down to the real implementation, `_FlexibleView`.
struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let delegate: FlexibleViewDelegate?
    let content: (Data.Element) -> Content
    // The initial width should not be `0`, otherwise all items will be layouted in one row,
    // and the actual layout width may exceed the value we desired.
    @State private var availableWidth: CGFloat = 10
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            
            _FlexibleView(
                availableWidth: availableWidth,
                data: data,
                spacing: spacing,
                alignment: alignment,
                content: content,
                delegate: delegate
            )
        }
    }
}


/// This view is responsible to lay down the given elements and wrap them into
/// multiple rows if needed.
struct _FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    var delegate: FlexibleViewDelegate?
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow += 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            remainingWidth -= (elementSize.width + spacing)
        }
        delegate?.totalOfRow(row: currentRow + 1)
        return rows
    }
}