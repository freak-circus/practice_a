//
//  ProfileViewController.swift
//  practiceApp
//
//  Created by Богдан on 02.07.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    var user: User?

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            image.image = user.image
            image.layer.cornerRadius = image.frame.size.width / 2
            image.clipsToBounds = true
            username.text = user.username
            realName.text = user.name
            phone.text = user.phone
            bio.text = user.bio
        }
    }
    
}
