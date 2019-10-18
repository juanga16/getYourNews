//
//  DetailsController.swift
//  getYourNews
//
//  Created by Cosme Fulanito on 14/10/2019.
//  Copyright © 2019 Cosme Fulanito. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    var newToShow: New?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    @IBAction func backButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let new = newToShow {
            titleLabel.text = new.title
            authorLabel.text = "By " + new.author
            descriptionLabel.text = new.description
            
            if new.urlToImage != "" {
                downloadImage(urlToImage: new.urlToImage)
            } else {
                imageView.isHidden = true
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM-dd HH:mm"
            publishedAtLabel.text = dateFormatter.string(from: new.publishedAt)
            
            contentLabel.text = new.content
            
            print("New")
            print(new.content)
            print(new.urlToImage)
            print(new.description)
        }
    }
}

extension DetailsController {
    
    func downloadImage(urlToImage: String) {
        URLSession.shared.dataTask(with: URL(string: urlToImage)!) {
            data, response, error in
            
            if let error = error {
                print("ERROR DOWNLOADING IMAGE")
                print(error)
                
                return
            }
            
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data!)
            }
        }.resume()
    }
}
