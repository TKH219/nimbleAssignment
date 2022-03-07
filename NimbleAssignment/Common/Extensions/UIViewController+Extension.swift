//
//  UIViewController+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupSwipeGoBack(){
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func goBack(){
        UIView.animate(withDuration: 1) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
