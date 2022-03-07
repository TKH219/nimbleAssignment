//
//  ViewController.swift
//  nimbleAssignment
//
//  Created by Trần Khánh Hà on 02/03/2022.
//
import UIKit
import SnapKit

class ViewController: BaseViewController {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "survey_district_title"
        label.numberOfLines = 3
//        label.font = Font.bold.size(20)
        return label
    }()

    override func setupView() {
        super.setupView()
        self.title = "survey_district_navigation_title"
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:Font.bold.medium]
        self.view.addSubview(titleLabel)
    }
    
    override func setupConstrain() {
        super.setupConstrain()
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
//            make.bottom.equalTo(subtitleLabel.snp.top).offset(-16)
        }
    }
}

