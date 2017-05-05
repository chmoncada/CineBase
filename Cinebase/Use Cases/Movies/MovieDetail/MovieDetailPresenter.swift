//
//  MovieDetailPresenter.swift
//  Cinebase
//
//  Created by Gustavo Villar on 4/18/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import Foundation


class MovieDetailPresenter {
    
    weak var view: MovieDetailView?
    fileprivate let movie: Movie
    fileprivate let authenticationManager: AuthenticationManagerProtocol
<<<<<<< HEAD
    var presentBuyingOptions: ((User, Movie) -> Void)?
    
    init(view: MovieDetailView, movie: Movie, authenticationManager: AuthenticationManagerProtocol = AuthenticationManager.shared) {
=======
    private let moviesAPIClient: MoviesAPIClient
    private weak var fetchTrailerRequest: WebAPIRequestProtocol?
    
    init(view: MovieDetailView, router: MovieDetailRouterProtocol, movie: Movie, authenticationManager: AuthenticationManagerProtocol = AuthenticationManager.shared, moviesAPIClient: MoviesAPIClient = MoviesAPIClient() ) {
>>>>>>> segmentedControl
        self.view = view
        self.movie = movie
        self.authenticationManager = authenticationManager
        self.moviesAPIClient = moviesAPIClient
    }
    
    func onViewLoad() {

        let movieViewModel = MovieViewModel(title: movie.title, backdropPath: movie.backdropPath, overview: movie.overview)
        view?.display(movieViewModel)
    }
    
    func buyTickets() {
        guard let view = view else { return }
        authenticationManager.delegate = self
        authenticationManager.requestLoginWithGoogle(from: view)
    }
    
    func playTrailer() {
        fetchTrailerRequest = moviesAPIClient.fetchTrailersOfMovieWithID(movie.movieID, completion: { (result) in
            if let video = result.value?[(result.value?.count)! - 1] {
                self.router.playYoutubeVideo(withKey: video.key)
            }
        })
    }
    
}

// MARK: - Authentication Manager delegate
extension MovieDetailPresenter: AuthenticationManagerDelegate {
    func authenticationManager(_ manager: AuthenticationManagerProtocol, didLoginWith user: User) {
        presentBuyingOptions?(user, movie)
    }
}
