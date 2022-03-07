//
//  BaseViewController.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupView()
        setupConstrain()
    }
    
    func setupData() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    func setupView() {
        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBar
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        if #available(iOS 11.0, *) {
            self.navigationItem.backButtonTitle = ""
        }
        
        self.view.backgroundColor = UIColor.gray_e5e5
    }
    
    func setupConstrain() {}
}
    
