//
//  EmailVerificationViewController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit
import FirebaseAuth

class EmailVerificationViewController: UIViewController {
    
    let messageLabel = UILabel()
    let sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        messageLabel.text = "Please check your email for a verification link. Click the link to verify your email address."
        messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        messageLabel.numberOfLines = 3
        messageLabel.textAlignment = .center
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(40)
        }
        
        sendButton.setTitle("Send mail again", for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
        view.addSubview(sendButton)
        
        sendButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(50)
        }
    }
    
    @objc func sendButtonClicked(){
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if let error = error {
                self.makeAlert(title: "Error", message: "Error sending verification number: \(error.localizedDescription)")
            } else {
                self.makeAlert(title: "Success", message: "Verification email sent successfully.")
            }
        })
    }
    
    func makeAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}
