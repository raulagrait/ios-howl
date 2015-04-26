//
//  BusinessCell.swift
//  Howl
//
//  Created by Raul Agrait on 4/25/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation
import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var business: Business? {
        didSet {
            if let business = business {
                if let imageUrl = business.imageUrl {
                    thumbnailImageView.setImageWithURL(imageUrl)
                }
                
                if let name = business.name {
                    nameLabel.text = name
                }
                
                if let distance = business.distance {
                    distanceLabel.text = distance
                }
                
                if let ratingImageUrl = business.ratingImageUrl {
                    ratingImageView.setImageWithURL(ratingImageUrl)
                }
                
                if let reviewCount = business.reviewCount {
                    reviewCountLabel.text = "\(reviewCount) Reviews"
                }
                
                if let address = business.address {
                    addressLabel.text = address
                }
                
                if let categories = business.categories {
                    categoriesLabel.text = categories
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 3
        thumbnailImageView.clipsToBounds = true
    }
    
    
}