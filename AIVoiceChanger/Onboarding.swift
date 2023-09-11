//
//  ViewController.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 7.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class Onboarding: UIViewController {
    
    var sphereImageView = UIImageView()
    var microphoneImageView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var declarationLabel = UILabel()
    var continueButton = CustomGradientButton()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupUI()
    }

    func setupUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        
        
        sphereImageView.image = UIImage(named: "stars.sphere")
        
                view.addSubview(sphereImageView)
        sphereImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(157)
            make.centerX.equalToSuperview()
            make.width.equalTo(192)
            make.height.equalTo(154)
            
        }
        
        microphoneImageView.image = UIImage(named: "microphone")

        sphereImageView.addSubview(microphoneImageView)
        microphoneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(87)
            make.height.equalTo(85.5)
        }
            
            
            titleLabel.text = "Welcome to Voice Ai: Rap generator"
            titleLabel.textAlignment = .center
            titleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
            titleLabel.numberOfLines = 0
            titleLabel.sizeToFit()
            titleLabel.font = Font.custom(size: 34, fontWeight: .Bold)
            
            view.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(sphereImageView.snp.bottom).offset(48)
                make.width.equalTo(292)
              
            }
            
            subtitleLabel.text = "The ultimate \nRap Song generator experience."
            subtitleLabel.textAlignment = .center
            subtitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
            subtitleLabel.numberOfLines = 0
//            subtitleLabel.sizeToFit()
            subtitleLabel.font = Font.custom(size: 20, fontWeight: .Medium)
            
            view.addSubview(subtitleLabel)
            subtitleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(titleLabel.snp.bottom).offset(3)
                make.width.equalTo(350)
               
            }
            
            declarationLabel.text = "• Write a prompt & get lyrics \n• Choose a beat \n• Choose your favorite rapper \n• Share your creation"
            declarationLabel.textAlignment = .center
            declarationLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
            declarationLabel.numberOfLines = 0
            declarationLabel.sizeToFit()
            declarationLabel.font = Font.custom(size: 17, fontWeight: .Medium)
            
            view.addSubview(declarationLabel)
            declarationLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
                make.width.equalTo(300)
              
            }
            
            continueButton.setTitle("Continue", for: .normal)
            continueButton.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
       
            continueButton.addTarget(self, action: #selector(continueButtonClicked), for: .touchUpInside)
            
            view.addSubview(continueButton)
            continueButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(declarationLabel.snp.bottom).offset(63)
                make.width.equalTo(350)
                make.height.equalTo(60)
            }
                   
            
        }
        
    @objc func continueButtonClicked() {
        
        present(destinationVC: PaywallVC(), slideDirection: .right)
        
    }

}

