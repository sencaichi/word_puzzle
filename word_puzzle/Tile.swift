//
//  Tile.swift
//  word_puzzle
//
//  Created by Sen Cai on 10/7/23.
//

import SwiftUI

// 2 properties that determine visual state
// the letter/character and the evaluation state

struct Tile: View {
    
    let letter: Character?
    let evaluation: LetterEvaluation?
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 4)
                .style(withStroke: Color.black, lineWidth: 1, fill: tileColor)
                .aspectRatio(1, contentMode: .fit)
            if let letter = letter {
                        Text(String(letter))
                            .font(.system(size: 36, weight: .bold, design: .rounded))
            }
        }
    }
    private var tileColor: Color {
        guard let evaluation = evaluation else {
            return .tileBackground
        }
        return evaluation.color
    }
}

extension Shape {
    func style<StrokeStyle: ShapeStyle, FillStyle: ShapeStyle>(
        withStroke strokeContent: StrokeStyle,
        lineWidth: CGFloat = 1,
        fill fillContent: FillStyle
    ) -> some View {
        stroke(strokeContent, lineWidth: lineWidth)
            .background(fill(fillContent))
    }
}

private extension LetterEvaluation {
    var color: Color {
        switch self {
        case .notIncluded:
            return .tileBackground
        case .included:
            return .yellow
        case .match:
            return .green
            
        }
    }
}
