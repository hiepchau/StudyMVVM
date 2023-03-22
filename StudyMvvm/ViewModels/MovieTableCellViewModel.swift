//
//  MovieTableCellViewModel.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import Foundation   

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    

    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
    
}
