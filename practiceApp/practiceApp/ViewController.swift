//
//  ViewController.swift
//  practiceApp
//
//  Created by Богдан on 30.06.2024.
//

import UIKit

class User {
    public var username: String
    public var passwordHash: Int
    public var name: String
    public var phone: String
    public var bio: String
    public var image: UIImage
    private var favoriteBooks: [Book]
    
    init(username: String, passwordHash: Int, name: String, phone: String, bio: String, image: UIImage, favoriteBooks: [Book]) {
        self.username = username
        self.passwordHash = passwordHash
        self.name = name
        self.phone = phone
        self.bio = bio
        self.image = image
        self.favoriteBooks = favoriteBooks
    }
}

class ViewController: UIViewController {
    var users: [User] = [User(username: "bob_lesorub", passwordHash: "lesopoval".hashValue, name: "Bob Bober", phone: "+7 999 021 21 12", bio: "мой пароль не связан с моей профессией. мошенники, хватит пытаться подобрать его.", image: UIImage(named: "lesorub")!, favoriteBooks: []), User(username: "ivan_musk", passwordHash: "electroparovoz".hashValue, name: "Ivan Musk", phone: "+1 111 01 21 2122222", bio: "официальный аккаунт самого гениального строителя гибридных электропаровозов в минске", image: UIImage(named: "mister")!, favoriteBooks: [])]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Error.text = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: nil, action: nil)
    }
    
    @IBOutlet weak var Error: UILabel!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBAction func Enter(_ sender: UIButton) {
        for user in users {
            if user.username == Username.text {
                if user.passwordHash == Password.text?.hashValue {
                    Error.text = ""
                    let storyboard = UIStoryboard(name: "Auth", bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                        vc.user = user
                        navigationController?.pushViewController(vc, animated: true)
                    }
                }
                else {
                    Error.text = "username or password is incorrect"
                    return
                }
            }
        }
    }
    
}
