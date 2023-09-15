//
//  SettingsVC.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 9.09.2023.
//

import UIKit
import NeonSDK

class SettingsVC: UIViewController {
    
    var settingsTitleLabel = UILabel()
    let backButton = UIButton()
    
    let premiumButton = UIButton()
    let shareButton = UIButton()
    let rateButton = UIButton()
    let contactButton = UIButton()
    let termsButton = UIButton()
    let privacyButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
       settingsTitleLabel.text = "Settings"
       settingsTitleLabel.textAlignment = .center
       settingsTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
       settingsTitleLabel.sizeToFit()
       settingsTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        view.addSubview(settingsTitleLabel)
       settingsTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.height.equalTo(28)
          
        }
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(settingsTitleLabel)
            make.left.equalToSuperview().offset(36)
         
        }
        
        premiumButton.setTitle("Premium", for: .normal)
        premiumButton.titleLabel?.textAlignment = .left
        premiumButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
        
        premiumButton.sizeToFit()
   
        premiumButton.addTarget(self, action: #selector(premiumButtonClicked), for: .touchUpInside)
        
        view.addSubview(premiumButton)
        premiumButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(52)
            make.top.equalTo(settingsTitleLabel.snp.bottom).offset(43)
            make.height.equalTo(25)
            
        }
        
        shareButton.setTitle("Share app", for: .normal)
        shareButton.titleLabel?.textAlignment = .left
        shareButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
        shareButton.sizeToFit()
   
        shareButton.addTarget(self, action: #selector(shareButtonClicked), for: .touchUpInside)
        
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.left.equalTo(premiumButton)
            make.top.equalTo(premiumButton.snp.bottom).offset(32)
            make.height.equalTo(25)
        }
        
        rateButton.setTitle("Rate us", for: .normal)
        rateButton.titleLabel?.textAlignment = .left
        rateButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
   
        rateButton.sizeToFit()
        rateButton.addTarget(self, action: #selector(rateButtonClicked), for: .touchUpInside)
        
        view.addSubview(rateButton)
        rateButton.snp.makeConstraints { make in
            make.left.equalTo(premiumButton)
            make.top.equalTo(shareButton.snp.bottom).offset(32)
            make.height.equalTo(25)
        }
        
        contactButton.setTitle("Contact us", for: .normal)
        contactButton.titleLabel?.textAlignment = .left
        contactButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
   
        contactButton.sizeToFit()
        contactButton.addTarget(self, action: #selector(contactButtonClicked), for: .touchUpInside)
        
        view.addSubview(contactButton)
        contactButton.snp.makeConstraints { make in
            make.left.equalTo(premiumButton)
            make.top.equalTo(rateButton.snp.bottom).offset(32)
            make.height.equalTo(25)
        }
        
        termsButton.setTitle("Terms of service", for: .normal)
        termsButton.titleLabel?.textAlignment = .left
        termsButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
   
        termsButton.sizeToFit()
        termsButton.addTarget(self, action: #selector(termsButtonClicked), for: .touchUpInside)
        
        view.addSubview(termsButton)
        termsButton.snp.makeConstraints { make in
            make.left.equalTo(premiumButton)
            make.top.equalTo(contactButton.snp.bottom).offset(32)
            make.height.equalTo(25)
        }
        
        privacyButton.setTitle("Privacy policy", for: .normal)
        privacyButton.titleLabel?.textAlignment = .left
        privacyButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
   
        privacyButton.sizeToFit()
        privacyButton.addTarget(self, action: #selector(privacyButtonClicked), for: .touchUpInside)
        
        view.addSubview(privacyButton)
        privacyButton.snp.makeConstraints { make in
            make.left.equalTo(premiumButton)
            make.top.equalTo(termsButton.snp.bottom).offset(32)
            make.height.equalTo(25)
        }
    }
    
    @objc func backButtonClicked() {
        
        dismiss(animated: true)
    }
    
    @objc func premiumButtonClicked() {
        
        present(destinationVC: PaywallVC(), slideDirection: .down)
    }
    
    
    @objc func shareButtonClicked() {
        
        let shareText = "Hey, check out this cool app!"
           let shareURL = URL(string: "https://www.example.com/your-app")
           
           let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL as Any], applicationActivities: nil)
           
           if let popoverController = activityViewController.popoverPresentationController {
               popoverController.sourceView = self.view
               popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
               popoverController.permittedArrowDirections = []
           }
           
           present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    @objc func rateButtonClicked() {
        
        if let rateURL = URL(string: "tms-apps://itunes.apple.com/app/your-app-id") {
              UIApplication.shared.open(rateURL, options: [:], completionHandler: nil)
            
            }

        
    }
    
    @objc func contactButtonClicked() {
        
        let emailAddress = "support@neonapps.co"
            let subject = "AI Voice Changer"
            
            if let emailURL = URL(string: "mailto:\(emailAddress)?subject=\(subject)") {
                UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
            }
    }
    
    @objc func termsButtonClicked() {
        
        SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/terms-of-use")
        
    }
    
    @objc func privacyButtonClicked() {
        
        SettingsManager.openLinkFromBrowser(url: "https://www.neonapps.co/privacy-policy")
        
    }

}
