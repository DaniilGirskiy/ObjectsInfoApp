//
//  ObjectsReviewHeaderCell.swift
//  AVSOFT
//
//  Created by Danya on 30.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class ObjectsReviewHeaderCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        editButtonPressed?()
    }
    
    var editButtonPressed: (() -> Void)?
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
