//
//  DescriptionLabel.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 04/03/2022.
//

import Foundation
import UIKit

class DescriptionLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(descriptionString: String = "") {
        super.init(frame: CGRect.zero)
        self.text = descriptionString
        let font = Font.regular.size(17)
        self.font = font
        self.textColor = .gray
        self.numberOfLines = 2
    }
}
