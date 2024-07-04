import UIKit

class FavoritesManager {
    
    static let shared = FavoritesManager()
    private var favoriteBooks: [Book] = []
    
    func add(book: Book) {
        favoriteBooks.append(book)
    }
    
    func isFavorite(book: Book) -> Bool {
        return favoriteBooks.contains(where: { $0.title == book.title })
    }
    
    var favorites: [Book] {
        return favoriteBooks
    }
}
