//
//  PaywallVC.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 7.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class PaywallVC: UIViewController {
    
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let image4 = UIImageView()
    
    var premiumTitleLabel =  UILabel()
    var premiumFeaturesLabel = UILabel()
    var secondPremiumFeaturesLabel = UILabel()
    var thirdPremiumFeaturesLabel = UILabel()
    
    var paymentOptionButton = UIButton()
    var paymentDetailLabel = UILabel()
    var paymentAmountLabel = UILabel()
    var continueButton = CustomGradientButton()
    var withoutPurchaseButton = UIButton()
    let exitView = UIView()
    let exitButton = UIButton()
    
    
    let legalView = NeonLegalView()
    
    let icon = UIImageView()
    let icon2 = UIImageView()
    let icon3 = UIImageView()
    let circleImage = UIImageView()
    let roundImage = UIImageView()
    let shortlineImage = UIImageView()
    let shortlineImage2 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        packageFetched()
        Neon.onboardingCompleted()
        
        createUI()
    }
    
    func createUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        image1.image = UIImage(named: "image1")
        view.addSubview(image1)
        image1.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalTo(190)
            make.height.equalTo(view.snp.height).dividedBy(4)
        }
        
        image2.image = UIImage(named: "image2")
        view.addSubview(image2)
        image2.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.width.equalTo(190)
            make.height.equalTo(view.snp.height).dividedBy(4)
        }
        
        image3.image = UIImage(named: "image3")
        view.addSubview(image3)
        image3.snp.makeConstraints { make in
            make.top.equalTo(image1.snp.bottom).offset(9)
            make.left.equalTo(image1)
            make.width.equalTo(190)
            make.height.equalTo(view.snp.height).dividedBy(4)
        }
        
        image4.image = UIImage(named: "image4")
        view.addSubview(image4)
        image4.snp.makeConstraints { make in
            make.top.equalTo(image1.snp.bottom).offset(9)
            make.right.equalTo(image2)
            make.width.equalTo(190)
            make.height.equalTo(view.snp.height).dividedBy(4)
        }
        
        premiumTitleLabel.text = "Try Premium!"
        premiumTitleLabel.textAlignment = .center
        premiumTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        premiumTitleLabel.font = Font.custom(size: 34, fontWeight: .Bold)
        view.addSubview(premiumTitleLabel)
        premiumTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(image3.snp.bottom).offset(33)
            make.width.equalTo(350)
            make.height.equalTo(41)
        }
        
        premiumFeaturesLabel.text = "Limited Ads"
        premiumFeaturesLabel.textAlignment = .left
        premiumFeaturesLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        premiumFeaturesLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        view.addSubview(premiumFeaturesLabel)
        premiumFeaturesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(69)
            make.top.equalTo(premiumTitleLabel.snp.bottom).offset(30)
            make.width.equalTo(280)
            make.height.equalTo(22)
        }
        
        secondPremiumFeaturesLabel.text = "Using Example Prompts"
        secondPremiumFeaturesLabel.textAlignment = .left
        secondPremiumFeaturesLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        secondPremiumFeaturesLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        view.addSubview(secondPremiumFeaturesLabel)
        secondPremiumFeaturesLabel.snp.makeConstraints { make in
            make.left.equalTo(premiumFeaturesLabel)
            make.top.equalTo(premiumFeaturesLabel.snp.bottom).offset(9)
            make.width.equalTo(280)
            make.height.equalTo(22)
        }
        
        thirdPremiumFeaturesLabel.text = "Reach All Rappers and Beats"
        thirdPremiumFeaturesLabel.textAlignment = .left
        thirdPremiumFeaturesLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        thirdPremiumFeaturesLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        view.addSubview(thirdPremiumFeaturesLabel)
        thirdPremiumFeaturesLabel.snp.makeConstraints { make in
            make.left.equalTo(premiumFeaturesLabel)
            make.top.equalTo(secondPremiumFeaturesLabel.snp.bottom).offset(9)
            make.width.equalTo(280)
            make.height.equalTo(22)
        }
        
        icon.image = UIImage(named: "icon")
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(premiumFeaturesLabel)
            make.left.equalToSuperview().offset(54)
            make.width.equalTo(11)
            make.height.equalTo(12)
        }
        
        icon2.image = UIImage(named: "icon")
        view.addSubview(icon2)
        icon2.snp.makeConstraints { make in
            make.centerY.equalTo(secondPremiumFeaturesLabel)
            make.left.equalToSuperview().offset(54)
            make.width.equalTo(11)
            make.height.equalTo(12)
        }
        
        icon3.image = UIImage(named: "icon")
        view.addSubview(icon3)
        icon3.snp.makeConstraints { make in
            make.centerY.equalTo(thirdPremiumFeaturesLabel)
            make.left.equalToSuperview().offset(54)
            make.width.equalTo(11)
            make.height.equalTo(12)
        }
        
        paymentOptionButton.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        paymentOptionButton.layer.cornerRadius = 30
        paymentOptionButton.layer.borderWidth = 0.5
        paymentOptionButton.layer.borderColor = UIColor(red: 0.31, green: 0.34, blue: 1.00, alpha: 1.00).cgColor
        paymentOptionButton.addTarget(self, action: #selector(selectedPaymentOption), for: .touchUpInside)
        view.addSubview(paymentOptionButton)
        paymentOptionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(thirdPremiumFeaturesLabel.snp.bottom).offset(20)
            make.width.equalTo(350)
            make.height.equalTo(60)
        }
        
        paymentDetailLabel.text = "Lifetime"
        paymentDetailLabel.textAlignment = .left
        paymentDetailLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        paymentDetailLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        paymentOptionButton.addSubview(paymentDetailLabel)
        paymentDetailLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(38)
            make.width.equalTo(90)
            make.height.equalTo(22)
        }
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        continueButton.isEnabled = false
        continueButton.alpha = 0.6
        continueButton.addTarget(self, action: #selector(continueButtonClicked), for: .touchUpInside)
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(paymentOptionButton.snp.bottom).offset(23)
            make.width.equalTo(350)
            make.height.equalTo(60)
        }
        
        legalView.termsURL = "https://www.neonapps.co/terms-of-use"
        legalView.privacyURL = "https://www.neonapps.co/privacy-policy"
        legalView.restoreButtonClicked = {
            print("restored")
        }
        
        legalView.textColor = .black
        view.addSubview(legalView)
        legalView.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        circleImage.image = UIImage(named: "circle")
        paymentOptionButton.addSubview(circleImage)
        circleImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(13)
            make.height.width.equalTo(17)
        }
        
        roundImage.image = UIImage(named: "round")
        roundImage.isHidden = true
        circleImage.addSubview(roundImage)
        roundImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(9)
        }
        
        paymentAmountLabel.text = "$10"
        paymentAmountLabel.textAlignment = .center
        paymentAmountLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        paymentAmountLabel.font = Font.custom(size: 16, fontWeight: .Medium)
        paymentOptionButton.addSubview(paymentAmountLabel)
        paymentAmountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(28)
            make.width.equalTo(29)
            make.height.equalTo(21)
            
        }
        
        shortlineImage.image = UIImage(named: "shortline")
        legalView.addSubview(shortlineImage)
        shortlineImage.snp.makeConstraints { make in
            make.centerY.equalTo(legalView.privacyButton)
            make.left.equalTo(legalView.privacyButton.snp.right).offset(25)
            make.width.equalTo(3)
            make.height.equalTo(20)
        }
        
        shortlineImage2.image = UIImage(named: "shortline")
        legalView.addSubview(shortlineImage2)
        shortlineImage2.snp.makeConstraints { make in
            make.centerY.equalTo(legalView.privacyButton)
            make.left.equalTo(legalView.restoreButton.snp.right).offset(25)
            make.width.equalTo(3)
            make.height.equalTo(20)
        }
        
        exitView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        exitView.layer.cornerRadius = 25
        exitView.clipsToBounds = true
        exitView.contentMode = .scaleAspectFit
        view.addSubview(exitView)
        exitView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalToSuperview().inset(20)
            make.width.height.equalTo(50)
        }
        
        exitButton.setImage(UIImage(named: "exit"), for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonClicked), for: .touchUpInside)
        exitButton.clipsToBounds = true
        exitView.addSubview(exitButton)
        exitButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(25)
        }
    }
    
    @objc func exitButtonClicked() {
        present(destinationVC: FirstHomeVC(), slideDirection: .right)
    }
    
    @objc func continueButtonClicked() {
        RevenueCatManager.selectPackage(id: "com.neonapps.education.SwiftyStoreKitDemo.Montly")
        RevenueCatManager.purchase(animation: .loadingBar) {
            let vc = FirstHomeVC()
            self.present(destinationVC: vc, slideDirection: .right)
        } completionFailure: {
            print("purchase error")
        }
    }
    
    @objc func selectedPaymentOption() {
        roundImage.isHidden = false
        paymentOptionButton.layer.borderWidth = 3
        continueButton.alpha = 1
        continueButton.isEnabled = true

    }
    
    func packageFetched() {
        
        if let price = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Montly"){
            let monthlyPackagePrice = price
        }
        if let monthlyPackage = RevenueCatManager.getPackage(id: "com.neonapps.education.SwiftyStoreKitDemo.Montly"){
            let price = monthlyPackage.localizedPriceString
        }
    }
}
