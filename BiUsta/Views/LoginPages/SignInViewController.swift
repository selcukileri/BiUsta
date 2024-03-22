//
//  SignInViewController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    let emailTf = UITextField()
    let passwordTf = UITextField()
    let signUpButton = UIButton()
    let forgotButton = UIButton()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        //emailTf.placeholder = "Enter your email please"
        emailTf.text = "selcukileri98@gmail.com"
        
        //emailTf.textAlignment = .center
        emailTf.layer.cornerRadius = 10
        emailTf.leftViewMode = .always
        emailTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTf.frame
            .height))
        emailTf.backgroundColor = .systemGray6

        view.addSubview(emailTf)
        emailTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        //passwordTf.placeholder = "Enter your password please"
        passwordTf.text = "123456"
        //passwordTf.textAlignment = .center
        passwordTf.leftViewMode = .always
        passwordTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passwordTf.frame
            .height))
        passwordTf.backgroundColor = .systemGray6
        passwordTf.isSecureTextEntry = true
        passwordTf.layer.cornerRadius = 10
        view.addSubview(passwordTf)
        passwordTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTf).offset(80)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(emailTf.snp.height)
        }
        
        signUpButton.setTitle("Sign Up with New Account", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTf.snp.bottom).offset(50)
            make.width.equalToSuperview().inset(80)
            make.height.equalTo(50)
        }
        
        forgotButton.setTitle("Forgot Password", for: .normal)
        forgotButton.setTitleColor(.systemBlue, for: .normal)
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
        view.addSubview(forgotButton)
        
        forgotButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
        }
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotButton.snp.bottom)
            make.width.equalToSuperview().inset(60)
        }
    }
    
    @objc func signUpButtonTapped(){
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func forgotButtonTapped(){
        let forgotVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotVC, animated: true)
    }
    
    @objc func loginClicked(){
        Auth.auth().signIn(withEmail: emailTf.text!, password: passwordTf.text!) { authResult, error in
            if let error = error {
                print("Login Error: \(error.localizedDescription)")
            } else {
                let homeVC = HomeViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
    }
    
    func makeAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
