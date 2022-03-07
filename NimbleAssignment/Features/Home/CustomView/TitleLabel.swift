//
//  TitleLabel.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 04/03/2022.
//

import Foundation
import UIKit

class TitleLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(titleString: String = "") {
        super.init(frame: CGRect.zero)
        self.text = titleString
        let font = Font.regular.size(29)
        self.font = font
        self.textColor = .white
        self.numberOfLines = 2
    }
}
