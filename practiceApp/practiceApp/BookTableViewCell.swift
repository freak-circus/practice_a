//
//  BookTableViewCell.swift
//  practiceApp
//
//  Created by Богдан on 03.07.2024.
//

import Foundation
import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteIndicator: UIImageView!
}
