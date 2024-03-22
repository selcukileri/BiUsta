//
//  ViewController.swift
//  BiUsta
//
//  Created by Selçuk İleri on 22.03.2024.
//

import UIKit
import SnapKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "BiUsta"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutClicked))
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = logoutButton
        
        myLabel.text = "Mal Wildan"
        myLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        myLabel.textAlignment = .center
        view.addSubview(myLabel)
        myLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(40)
            make.height.equalTo(60)
        }
    }
    
        @objc func logoutClicked(){
            do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
            } catch {
                print(error.localizedDescription)
            }
    
        }


}

