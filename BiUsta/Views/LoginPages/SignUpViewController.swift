//
//  SignUpViewController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    let emailTf = UITextField()
    let passwordTf = UITextField()
    let registerButton = UIButton()
    let textButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        emailTf.placeholder = "Enter your email please"
        emailTf.backgroundColor = .systemGray6
        //emailTf.textAlignment = .center
        emailTf.leftViewMode = .always
        emailTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTf.frame
            .height))
        emailTf.layer.cornerRadius = 10
        view.addSubview(emailTf)
        emailTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        passwordTf.isSecureTextEntry = true
        passwordTf.placeholder = "Enter your password please"
        //passwordTf.textAlignment = .center
        passwordTf.layer.cornerRadius = 10
        passwordTf.leftViewMode = .always
        passwordTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passwordTf.frame
            .height))
        passwordTf.backgroundColor = .systemGray6
        view.addSubview(passwordTf)
        passwordTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTf).offset(80)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(emailTf.snp.height)
        }
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        view.addSubview(registerButton)
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTf.snp.bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        textButton.setTitle("Have you registered before?", for: .normal)
        textButton.setTitleColor(.systemBlue, for: .normal)
        textButton.addTarget(self, action: #selector(textButtonTapped), for: .touchUpInside)
        view.addSubview(textButton)
        
        textButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(10)
        }
        
    }
    
    @objc func registerButtonTapped(){
        
        Auth.auth().createUser(withEmail: emailTf.text!, password: passwordTf.text!) { authResult, error in
            guard let _ = authResult?.user, error == nil else {
                self.makeAlert(title: "Error", message: "\(error!.localizedDescription)")
                return
            }
            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                if let error = error {
                    self.makeAlert(title: "Error", message: "Error sending verification number: \(error.localizedDescription)")
                } else {
                    self.makeAlert(title: "Success", message: "Verification email sent successfully.")
                    let verificationVC = EmailVerificationViewController()
                    self.navigationController?.pushViewController(verificationVC, animated: true)
                }
            })
        }
        
    }
    
    @objc func textButtonTapped(){
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
    
    func makeAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
        
    }
    
    
}

