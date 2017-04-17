//
//  ParsingError.swift
//  Cineplanet
//
//  Created by Gustavo Villar on 4/11/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

/**
 Error that describes a json response that coundn't 
 be parsed into the appropriate model.
*/
struct ParsingError<Model>: LocalizedError, CustomDebugStringConvertible {
    
    var json: Any
    
    var errorDescription: String? {
        return "Unexpected response from the server"
    }
    
    var debugDescription: String {
        return "Error parsing \(Model.self) from \(json)"
    }
    
}
