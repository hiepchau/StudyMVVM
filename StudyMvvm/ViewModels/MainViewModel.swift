//
//  MainViewModel.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies {[weak self] result in
            guard let strongself = self else {return}
            strongself.isLoading.value = false
            
            
            switch result {
            case .success(let data):
                print("Top trending counts: \(data.results.count)")
                strongself.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func mapCellData(){
        movies.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
