//
//  ViewController.swift
//  StormViewer
//
//  Created by Brian Bellini on 24/06/2020.
//  Copyright © 2020 brianbellini.dev. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var unsortedPictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try!
            fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                unsortedPictures.append(item)
            }
        }
        // Do any additional setup after loading the view.
//        print(unsortedPictures)
        pictures = unsortedPictures.sorted()
//        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the 'Detail' view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            print(pictures[indexPath.row])
            vc.pictureList = pictures
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
