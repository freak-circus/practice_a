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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            coverImageView.image = book.cover
            titleLabel.text = book.title
            authorLabel.text = book.author
            descriptionLabel.text = book.description
        }
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        if let book = book {
            FavoritesManager.shared.add(book: book)
        }
    }
}
