import UIKit

struct Book {
    let id: UUID
    let cover: UIImage?
    let title: String
    let author: String
    let description: String
    var isSaved: Bool

    mutating func toggle() {
        isSaved.toggle()
    }
}
