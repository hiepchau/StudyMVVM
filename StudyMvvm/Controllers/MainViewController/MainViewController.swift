//
//  MainViewController.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSources: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    func configView() {
        self.title = "Main View"
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.getData()

    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let strongself = self,
                  let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                isLoading ? strongself.activityIndicator.startAnimating() :  strongself.activityIndicator.stopAnimating()
            }
        }
        viewModel.movies.bind { [weak self] movies in
            guard let strongself = self,
                  let movies = movies else { return }
            strongself.cellDataSources = movies
            strongself.reloadTableView()
        }
    }
    
    //MARK: - Navigation
    
    func openDetails(movieId: Int) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
    
        DispatchQueue.main.async {
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            let controller = DetailsMovieViewController(viewModel: detailsViewModel)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }


}
