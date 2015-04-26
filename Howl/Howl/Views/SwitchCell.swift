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
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?

    @IBAction func onSwitchValueChanged(sender: AnyObject) {
        delegate?.switchCell?(self, didChangeValue: cellSwitch.on)
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
