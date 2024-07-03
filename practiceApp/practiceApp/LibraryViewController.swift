//
//  LibraryViewController.swift
//  practiceApp
//
//  Created by Богдан on 03.07.2024.
//

import Foundation
import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        Book(cover: UIImage(named: "cover1")!, title: "Book 1", author: "Author 1", description: "Description 1"),
        Book(cover: UIImage(named: "cover2")!, title: "Book 2", author: "Author 2", description: "Description 2"),
        Book(cover: UIImage(named: "cover3")!, title: "Book 3", author: "Author 3", description: "Description 3"),
        Book(cover: UIImage(named: "cover4")!, title: "Book 4", author: "Author 4", description: "Description 4"),
        Book(cover: UIImage(named: "cover5")!, title: "Book 5", author: "Author 5", description: "Description 5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        let book = books[indexPath.row]
        
        cell.coverImageView.image = book.cover
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.favoriteIndicator.isHidden = !FavoritesManager.shared.isFavorite(book: book)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        performSegue(withIdentifier: "showBookDetail", sender: book)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail" {
            if let destinationVC = segue.destination as? BookDetailViewController, let book = sender as? Book {
                destinationVC.book = book
            }
        }
    }
}
