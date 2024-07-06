//
//  BookDetailViewController.swift
//  practiceApp
//
//  Created by Богдан on 04.07.2024.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var book: Book?
    let dataSource = BookManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            coverImageView.image = book.cover
            titleLabel.text = book.title
            authorLabel.text = book.author
            descriptionLabel.text = book.description
            if book.isSaved {
                favoriteButton.setImage(UIImage(systemName: "minus.square"), for: .normal)
            } else {
                favoriteButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
            }
        }
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        guard var book = book else { return }
        book.toggle()
        if dataSource.isFavorite(book: book) {
            favoriteButton.setImage(UIImage(systemName: "minus.square"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        }
    }
}
