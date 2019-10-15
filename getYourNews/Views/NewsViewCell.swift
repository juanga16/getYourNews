//
//  NewsViewsCell.swift
//  getYourNews
//
//  Created by Cosme Fulanito on 14/10/2019.
//  Copyright © 2019 Cosme Fulanito. All rights reserved.
//

import UIKit
import SwipeCellKit

class NewsViewCell: SwipeTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    
    func configure(new: New) {
        titleLabel.text = new.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-dd HH:mm"
        publishedAtLabel.text = dateFormatter.string(from: new.publishedAt)
    }
}
