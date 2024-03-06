//
//  TagView.swift
//
//
//  Created by Michael Shen[沈柏帆] on 2024/3/6.
//

import SwiftUI
import UIKit

public struct TagView: View {
    public var model = TagViewModel()
    
    public var uiview: UIView {
        UIHostingController(rootView: self).view
    }
    
    public init() {}
    
    public var body: some View {
        VStack {
            ScrollView {
                FlexibleView(
                    data: model.words,
                    spacing: model.spacing,
                    alignment: model.alignment,
                    delegate: self) { item in
                        Text(verbatim: item)
                            .font(Font(model.textFont))
                            .foregroundColor(Color(model.textColor))
                            .padding(.top, model.topPadding)
                            .padding(.leading, model.leadingPadding)
                            .padding(.trailing, model.trailingPadding)
                            .padding(.bottom, model.bottomPadding)
                            .background(
                                RoundedRectangle(cornerRadius: model.cornerRadius)
                                    .fill(Color(model.tagBackgroundColor))
                            )
                            .onTapGesture {
                                print("test \(item)")
                            }
                    }
//                .padding(.horizontal, model.)
            }
//            .overlay(Settings(model: model), alignment: .bottom)
//            Settings(model: model)
        }
    }
}

extension TagView: FlexibleViewDelegate {
    func totalOfRow(row: Int) {
        model.currentRow = row
    }
}

#Preview {
    TagView()
}
