//
//  MovieParser.swift
//  Cinebase
//
//  Created by Gustavo Villar on 4/17/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation

class MovieParser: ModelParser {
    typealias Model = Movie
    
    func parse(fromJSON json: [String : Any]) -> Result<Movie> {
        
//        self.movieID = json["id"] as? NSNumber ?? NSNumber(value: 0)
//        self.title = json["title"] as? String ?? ""
        
        guard let movieID = json["id"] as? Int,
            let title = json["title"] as? String,
            let imagePath = json["poster_path"] as? String,
            let backdropPath = json["backdrop_path"] as? String,
            let overview = json["overview"] as? String else {
                let parsingError = ParsingError<Movie>(json: json)
                return .failure(parsingError)
        }
        
        let imageURL = WebAPIClient.imageBaseURL + imagePath
        let backdropURL = WebAPIClient.imageBaseURL + backdropPath
        
        let movie = Movie(movieID: movieID, title: title, overview: overview, imagePath: imageURL, backdropPath: backdropURL)
        return .success(movie)
        
    }
}