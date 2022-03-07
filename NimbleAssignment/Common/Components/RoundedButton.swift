//
//  RoundedButton.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//
import UIKit

class RoundedButton: UIButton {
    
    init(imageString: String?) {
        super.init(frame: CGRect.zero)
        if let image = imageString {
            self.setImage(UIImage(named: image), for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.bounds.height / 2
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = true
    }
}
