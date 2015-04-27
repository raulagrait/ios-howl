//
//  DistanceCell.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

@objc protocol DistanceCellDelegate {
    optional func distanceCell(distanceCell: DistanceCell, didChangeSelectedIndex index: Int)
}

class DistanceCell: UITableViewCell {
    
    var indexPath: NSIndexPath?
    weak var delegate: DistanceCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if let indexPath = indexPath {
                delegate?.distanceCell?(self, didChangeSelectedIndex: indexPath.row)
            }
        }
    }
}
