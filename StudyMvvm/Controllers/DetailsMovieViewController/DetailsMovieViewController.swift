//
//  DetailsMovieViewController.swift
//  StudyMvvm
//
//  Created by Châu Hiệp on 29/12/2022.
//

import UIKit
import SDWebImage
import Hanson

class DetailsMovieViewController: UIViewController {

 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var textView: UITextView!

    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        configView()

    }
    

    
    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        imageView.sd_setImage(with: viewModel.movieImage)
        contentLabel.text = viewModel.movieDescription
    }

    
    @IBAction func buttonDidTouch(_ sender: Any) {
        viewModel.login()
    }
}

extension DetailsMovieViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
//        viewModel.observeTextChange(text: textView.text)
    }
}

internal class ListenerModule: NSObject, UITextFieldDelegate {
    
    static let shared = ListenerModule()
    var viewModel = BaseViewModel()
    internal func textWatcher(textField: UITextField!, view: UIViewController!, viewModel: BaseViewModel) {
        textField.delegate = self
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.viewModel = viewModel
    }
    
    @objc internal func textFieldDidChange(_ textField: UITextField) {
        viewModel.setDynamicTextField(text: textField.text, tag: textField.tag)
    }
}

