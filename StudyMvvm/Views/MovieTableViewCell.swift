//
//  MainMovieCell.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    static var identifier: String {
        get {
            return "MovieTableViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .lightGray, width: 1)
        backView.round()
        
        movieImageView.round(radius: 5)
        
    }
    
    func setupCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }

    
}
