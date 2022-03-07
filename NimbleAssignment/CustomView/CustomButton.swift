//
//  CustomButton.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 07/03/2022.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var completionBlock: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setTitleColor(.black_151A, for: .normal)
        self.layer.cornerRadius = 10
        self.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func onTapButton() {
        completionBlock?()
    }
}
