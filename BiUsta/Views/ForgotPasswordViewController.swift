//
//  ForgotPasswordViewController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    let emailTf = UITextField()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        emailTf.placeholder = "Please enter your e-mail"
        emailTf.backgroundColor = .systemGray6
        emailTf.layer.cornerRadius = 10
        emailTf.leftViewMode = .always
        emailTf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTf.frame
            .height))
        emailTf.textAlignment = .center
        view.addSubview(emailTf)
        
        emailTf.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        view.addSubview(submitButton)
        
        submitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTf).offset(80)
        }
    }
    
    @objc func submitClicked(){
        Auth.auth().sendPasswordReset(withEmail: emailTf.text!) { error in
            if let error = error {
                self.makeAlert(title: "Error", message: "Error sending password reset email: \(error.localizedDescription)")
            } else {
                self.makeAlert(title: "Success", message: "Password reset email sent successfully")
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
