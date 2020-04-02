//
//  ObjectEditingViewCell.swift
//  AVSOFT
//
//  Created by Danya on 17.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectEditingViewCell: UITableViewCell {
    @IBOutlet weak var attributeKeyLabel: UILabel!
    @IBOutlet weak var attributeValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
