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
        self.font = Font.bold.size(28)
        self.textColor = .white
        self.numberOfLines = 2
    }
}
