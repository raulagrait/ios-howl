//
//  DistanceCellTableViewCell.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

@objc protocol SortCellDelegate {
    optional func sortCell(sortCell: SortCell, didChangeSelectedIndex index: Int)
}

class SortCell: UITableViewCell {
    
    var indexPath: NSIndexPath?
    
    weak var delegate: SortCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            if let indexPath = indexPath {
                delegate?.sortCell?(self, didChangeSelectedIndex: indexPath.row)
            }
        }
    }
}