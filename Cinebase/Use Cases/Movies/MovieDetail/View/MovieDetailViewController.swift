//
//  MovieDetailViewController.swift
//  Cinebase
//
//  Created by Gustavo Villar on 4/18/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

struct MovieViewModel {
    var title: String
    var imagePath: String
    var overview: String
}

protocol MovieDetailView: class, LoginView {
    func display(_ movieViewModel: MovieViewModel)
}

class MovieDetailViewController: UIViewController, MovieDetailView {
    
    var presenter: MovieDetailPresenter!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        edgesForExtendedLayout = []
        presenter.onViewLoad()
    }
    
    func display(_ movieViewModel: MovieViewModel) {
        title = movieViewModel.title
        overviewLabel.text = movieViewModel.overview
    }
    
    @IBAction func buyTickets(_ sender: Any) {
        presenter.buyTickets()
    }
}

// MARK: - Login View
extension MovieDetailViewController {
    func presentLogin(_ loginViewController: UIViewController) {
        present(loginViewController, animated: true)
    }
}
