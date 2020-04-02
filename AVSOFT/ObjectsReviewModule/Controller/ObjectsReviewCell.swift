//
//  ObjectsReviewCell.swift
//  AVSOFT
//
//  Created by Danya on 29.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsReviewCell: UITableViewCell {

    @IBOutlet weak var attributeKeyLabel: UILabel!
    @IBOutlet weak var attributeValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
