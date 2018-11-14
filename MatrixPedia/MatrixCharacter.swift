//
//  MatrixCharacter.swift
//  MatrixPedia
//
//  Created by Alexandre on 7/11/18.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation

enum MatrixCharacterType: String {
    case resistance, programs, exiles, potentials, truce
}

class MatrixCharacter {
    let id: Int
    let alias: String
    let type: MatrixCharacterType
    
    init?(json: [String:Any]) {
        guard let id = json["id"] as? Int, let alias = json["alias"] as? String, let typeString = json["type"] as? String,
            let type = MatrixCharacterType(rawValue: typeString) else {
                return nil
        }
        
        self.id = id
        self.alias = alias
        self.type = type
    }
}
