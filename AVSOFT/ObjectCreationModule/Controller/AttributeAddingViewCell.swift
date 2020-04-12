//
//  AttributeAddingViewCell.swift
//  AVSOFT
//
//  Created by Danya on 11.04.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class AttributeAddingViewCell: UITableViewCell {
   
    @IBOutlet weak var addAttributeButton: UIButton!
    @IBAction func addAttributeButtonPressed(_ sender: UIButton) {
        addAttributeButtonPressed?()
    }
    
    var addAttributeButtonPressed: (() -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
