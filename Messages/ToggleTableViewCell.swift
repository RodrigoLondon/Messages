//
//  ToggleTableViewCell.swift
//  Messages
//
//  Created by Lewis Jones on 17/07/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

import UIKit


protocol ToggleTableViewCellDelegate {
    func didToggle(isOn: Bool)
}


class ToggleTableViewCell: UITableViewCell {

    var delegate: ToggleTableViewCellDelegate?
    
    @IBAction func didTogggle(_ sender: UISwitch) {
        
        self.delegate?.didToggle(isOn: sender.isOn)
       
    }
    
}
