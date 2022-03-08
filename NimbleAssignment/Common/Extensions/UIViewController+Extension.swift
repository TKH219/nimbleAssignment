//
//  UIViewController+Extension.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit
import MBProgressHUD
import Toast_Swift

extension UIViewController {
    
    func showLoading(animated: Bool = true) {
        MBProgressHUD.showAdded(to: self.view, animated: animated)
    }
    
    func hideLoadding(animated: Bool = true) {
        MBProgressHUD.hide(for: self.view, animated: animated)
    }
    
    func showToast(_ message: String) {
        
        // Hide all toasts before show the new one
        self.view.hideAllToasts()
        
        var style = ToastStyle()
        style.fadeDuration = 1
        style.cornerRadius = 15
        
        ToastManager.shared.isQueueEnabled = true
        ToastManager.shared.style.verticalPadding = tabBarController == nil ? 60 : 40
        
        self.view.makeToast(message, style: style)
    }
    
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
