//
//  NetworkConstants.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import Foundation

class NetworkConstants {
    public static var shared = NetworkConstants()
    
    private init(){
        
    }
    
    public var apiKey: String {
        get {
            return "91540bd9c5f66b73ecfbef341a5bcd5f"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
