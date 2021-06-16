//
//  Word.swift
//  Take1
//
//  Created by MacBook Pro on 2.06.21.
//

import Foundation

struct Word: Identifiable {
    
    var id = UUID()
    var name: String
    var translate: String
    var analogy: String
    var shortAnalogy: String
}
