//
//  LoginViewController.swift
//  NimbleAssignment
//
//  Created by Trần Khánh Hà on 03/03/2022.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    
    var service = AuthenicationService()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"login_background")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"nimble_logo_white")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField(padding: UIEdgeInsets.init(top: 19, left: 12, bottom: 15, right: 12))
        textField.setPlaceHolder("Email")
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(padding: UIEdgeInsets.init(top: 19, left: 12, bottom: 15, right: 12))
        textField.setPlaceHolder("Password")
        textField.delegate = self
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: CustomButton = {
        let button = CustomButton(frame: .zero)
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = Font.bold.size(17)
        button.completionBlock = onTapLoginButton
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .equalCentering
        return stack
    }()
    
    override func setupView() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(stackView)
        self.view.addSubview(logoImage)
    }
    
    override func setupConstrain() {
        
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.height.equalTo(frameScreen.height)
            make.width.equalTo(frameScreen.width)
        }
        
        self.emailTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        self.passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        self.stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.centerY.centerX.equalToSuperview()
        }
        
        self.loginButton.snp.makeConstraints { make in
            make.width.left.right.equalToSuperview()
            make.height.equalTo(56)
        }
        
        self.logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.stackView.snp.top).offset(-109)
            make.height.equalTo(40)
            make.width.equalTo(168)
        }
    }
    
    func onTapLoginButton() {
        self.showLoading(animated: true)
        service.requestLogin(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.hideLoadding(animated: true)
            switch response {
            case .success(let data):
                UserDefaults.standard.set(data.data.attributes.accessToken, forKey: ACCESS_TOKEN)
                UserDefaults.standard.set(data.data.attributes.refreshToken, forKey: REFRESH_TOKEN)
                UserDefaults.standard.synchronize()
                let vc = HomePageViewController()
                strongSelf.navigationController?.pushViewController(vc, animated: true)
            case .failure(let err):
                strongSelf.showToast(err.localizedDescription)
            }
        })
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}
