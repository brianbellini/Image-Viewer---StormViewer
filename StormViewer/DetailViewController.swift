//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Brian Bellini on 24/06/2020.
//  Copyright © 2020 brianbellini.dev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var pictureList = [String]()
    var selectedPictureNumber: Int = 0
    var totalPictures: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPictures = pictureList.count
        print(totalPictures)
        if let selectedPictureNumber = pictureList.firstIndex(of: selectedImage!) {
            title = String(selectedPictureNumber + 1) + " of " + String(totalPictures)
        }
       
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
