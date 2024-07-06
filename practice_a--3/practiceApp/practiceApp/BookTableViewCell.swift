//
//  BookTableViewCell.swift
//  practiceApp
//
//  Created by Богдан on 04.07.2024.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteIndicator: UIImageView!

    func configurationCell(book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        favoriteIndicator.isHidden = true
        guard let cover =  book.cover else { return }
        coverImageView.image = cover

    }
}
