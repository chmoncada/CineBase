//
//  Movie.swift
//  Cinebase
//
//  Created by Gustavo Villar on 4/17/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let movieID: Int
    let title: String
    let overview: String
    let imagePath: String
    let backdropPath: String
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return  lhs.movieID == rhs.movieID &&
            lhs.title == rhs.title &&
            lhs.overview == rhs.overview &&
            lhs.imagePath == rhs.imagePath &&
            lhs.backdropPath == rhs.backdropPath
        
    }
}
