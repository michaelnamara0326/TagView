//
//  TagViewModel.swift
//  
//
//  Created by Michael Shen[沈柏帆] on 2024/3/6.
//

import UIKit
import SwiftUI

open class TagViewModel: ObservableObject {
    @Published public var tags = [
        "內湖科", "B", "C", "D", "E"
    ]
    
    @Published public var tagBackgroundColor: UIColor = .gray
    @Published public var cornerRadius: CGFloat = 40
    @Published public var spacing: CGFloat = 8
    @Published public var topPadding: CGFloat = 8
    @Published public var leadingPadding: CGFloat = 8
    @Published public var trailingPadding: CGFloat = 8
    @Published public var bottomPadding: CGFloat = 8
    @Published public var wordCount: Int = 93
    @Published public var alignmentIndex = 0
    @Published public var textColor: UIColor = .red
    @Published public var textFont: UIFont = .systemFont(ofSize: 12)
    public var currentRow = 0
    
    var words: [String] {
        Array(tags.prefix(wordCount))
    }
    
    let alignments: [HorizontalAlignment] = [.leading, .center, .trailing]
    
    var alignment: HorizontalAlignment {
        alignments[alignmentIndex]
    }
}
