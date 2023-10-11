//
//  WordProvider.swift
//  word_puzzle
//
//  Created by Sen Cai on 10/8/23.
//

import Foundation

struct WordProvider {
    static let allowedWords: [String] = [
        "CANDY",
        "BONES",
        "TEETH",
        "FANGS",
        "DEATH",
        "GHOST",
        "DEMON",
        "CLAWS",
        "WITCH",
        "APPLE",
        "CURSE",
        "BLOOD",
        "TEARS",
        "MOUSE",
        "Haunt",
        "Spook",
        "Skull",
        "Mummy",
        "Grave",
        "Gloom",
        "Scare",
        "Eerie",
        "Coven",
        "Treat"
    ]
    
    static func generateWord() -> String {
        Self.allowedWords.randomElement()!
    }
}
