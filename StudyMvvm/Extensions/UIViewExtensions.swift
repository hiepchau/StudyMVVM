//
//  UIViewExtensions.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import Foundation
import UIKit

extension UIView {
    func round(radius: CGFloat = 10){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
