//
//  SwitchCell.swift
//  Howl
//
//  Created by Raul Agrait on 4/26/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit


@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
    optional func switchCell(switchCell: SwitchCell, atIndex index: Int, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!

    weak var delegate: SwitchCellDelegate?
    var indexPath: NSIndexPath?

    @IBAction func onSwitchValueChanged(sender: AnyObject) {
        handleValueChanged()
    }
    
    func handleValueChanged() {        
        if let indexPath = indexPath {
            if indexPath.section == 0 {
                delegate?.switchCell?(self, didChangeValue: cellSwitch.on)
            } else if indexPath.section == 3 {
                delegate?.switchCell?(self, atIndex: indexPath.row, didChangeValue: cellSwitch.on)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
