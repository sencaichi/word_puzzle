//
//  WordBoard.swift
//  word_puzzle
//
//  Created by Sen Cai on 10/7/23.
//

import SwiftUI
import Combine

struct WordBoard: View {
    @StateObject private var viewModel = WordBoardViewModel()
    @FocusState private var textFieldActive: Bool
    
    var body: some View {
        VStack {
            ZStack {
                TextField("", text: $viewModel.string)
                    .keyboardType(.asciiCapable)
                    .disableAutocorrection(true)
                    .focused($textFieldActive)
                    .opacity(0)
                    .onChange(of: viewModel.string, initial: false) {old, new in
                        viewModel.validateString(new, previousString: old)
                    }
    
                MatrixGrid(
                    width: viewModel.width,
                    height: viewModel.height,
                    spacing: 8
                ) { row, column in
                    Tile(
                        letter: viewModel.letters[row][column],
                        evaluation: viewModel.evaluations[row][column]
                    )
                }
                .frame(maxHeight: .infinity)
                .onTapGesture {
                    textFieldActive.toggle()
                }
            }
            Button("New Game") {
                viewModel.newGame()
            }
            .padding(8)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .alert("You won!", isPresented: $viewModel.solved) {
            Button("OK", role: .none) {
                viewModel.solved = false
            }
        }
        .alert("You lost!", isPresented: $viewModel.lost) {
            Button("OK", role: .none) {
                viewModel.lost = false
            }
        } message: {
            Text("The word was: \n" + viewModel.solution.uppercased())
        }
    }
}

#Preview {
    WordBoard()
}
