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
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var viewInBrowserTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let new = newToShow {
            authorLabel.text = new.author
            
            /*
            let attributedString = NSMutableAttributedString(string: "View in Browser")
            let url = URL(string: new.url)!
            attributedString.setAttributes([.link : url], range:  NSMakeRange(8, 7))
            
            viewInBrowserTextField.attributedText = attributedString
            viewInBrowserTextField.isUserInteractionEnabled = true
            viewInBrowserTextField.isEditable = false
            viewInBrowserTextField.linkTextAttributes = [ .foregroundColor: UIColor.blue, .underlineStyle: NSUnderlineStyle.single.rawValue]
            */
        }
    }
}

