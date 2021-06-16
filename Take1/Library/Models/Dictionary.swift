//
//  Dictionary.swift
//  Take1
//
//  Created by MacBook Pro on 2.06.21.
//

import Foundation

struct Dictionary: Identifiable {
    
    var id = UUID()
    var name: String
    var words = [Word]()
}
