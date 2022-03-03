//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Halimcan Dayal on 3.03.2022.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    

    
}
