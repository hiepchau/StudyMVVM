//
//  DetailsMovieViewModel.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import Foundation

class BaseViewModel {
    
    func setDynamicTextField(text: String?, tag: Int) { }
}

class DetailsMovieViewModel: BaseViewModel {
    
    var movieData: Movie
    
    var movieImage: URL? = nil
    var movieTitle: String = ""
    var movieDescription: String = ""
    var movieId: Int = 1
    var textInput: Observable<String> = Observable("")
    
    var username: String?
    var password: String?
    
    init(movie: Movie) {
        self.movieData = movie
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        super.init()
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
        
    override func setDynamicTextField(text: String?, tag: Int) {
        if tag == 0 {
            username = text
        } else {
            password = text
        }
   
//        password = text
    }
    
//    func observeTextChange(text: String?) {
//        self.textInput.value = text ?? ""
//    }
    
    
    func login() {
        print("USERNAME: \(username) PASSWORD: \(password)")
    }
    
    func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}


