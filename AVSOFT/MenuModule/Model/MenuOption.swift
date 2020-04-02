//
//  MenuModel.swift
//  AVSOFT
//
//  Created by Danya on 28.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case editing
    case review
    case programInformation
    
    var description: String {
        switch self {
        case .editing: return "Editing"
        case .review: return "Review"
        case .programInformation: return "About program"
        }
    }

    var image: UIImage {
        switch self {
        case .editing: return UIImage(systemName: "wrench") ?? UIImage()
        case .review: return UIImage(systemName: "wrench") ?? UIImage()
        case .programInformation: return UIImage(systemName: "wrench") ?? UIImage()
        }
    }
    
}
