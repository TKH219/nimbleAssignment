//
//  HomeViewController.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    var step: Step
    
    init(with step: Step) {
        self.step = step
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"logo_hoozing")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    lazy var titleLabel = TitleLabel()
    lazy var descriptionLabel = DescriptionLabel()
    lazy var nextButton = RoundedButton(imageString: "circle_button")
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override func setupView() {
        descriptionLabel.font = Font.regular.size(17)
        self.view.addSubview(nextButton)
        self.view.addSubview(backgroundImageView)
        
        switch(self.step) {
        case Step.step1:
            backgroundImageView.image = UIImage(named:"home_screen_step_1")
            titleLabel.text = "Working from home Check-In"
            descriptionLabel.text = "We would like to know how you feel about our work from home..."
        case .step2:
            backgroundImageView.image = UIImage(named:"home_screen_step_2")
            titleLabel.text = "Career training and development"
            descriptionLabel.text = "We would like to know what are your goals and skills you wanted..."
        case .step3:
            backgroundImageView.image = UIImage(named:"home_screen_step_3")
            titleLabel.text = "Inclusion and belonging"
            descriptionLabel.text = "Building a workplace culture that prioritizes belonging and inclusio..."
        }
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
    }
    
    override func setupConstrain() {
        self.nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-54)
            make.width.height.equalTo(56)
            make.right.equalToSuperview().offset(-20)
        }
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.height.equalTo(frameScreen.height)
            make.width.equalTo(frameScreen.width)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-96)
            make.bottom.equalToSuperview().offset(-54)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-16)
        }
    }
}
