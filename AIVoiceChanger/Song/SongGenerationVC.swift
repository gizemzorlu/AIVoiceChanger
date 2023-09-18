//
//  HomeVC3.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 9.09.2023.
//

import UIKit
import NeonSDK

class SongGenerationVC: UIViewController {
    
    let generatingTitleLabel = UILabel()
    let declarationLabel = UILabel()
    let backButton = UIButton()
    
    var timer : Timer?


    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        timerFunc()
    }
    
    func createUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        generatingTitleLabel.text = "Generating \nAI Voice"
        generatingTitleLabel.textAlignment = .center
        generatingTitleLabel.numberOfLines = 0
        generatingTitleLabel.sizeToFit()
        generatingTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        generatingTitleLabel.sizeToFit()
        generatingTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        view.addSubview(generatingTitleLabel)
        generatingTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(351)
          
        }
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(generatingTitleLabel)
            make.left.equalToSuperview().offset(36)

        }
        
        let lottie = LottieManager.createLottie(animation: .loadingCircle3)
        view.addSubview(lottie)
        lottie.snp.makeConstraints {make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
                                   
        
        declarationLabel.text = "Please wait while we're generating your song \nkeep the app open"
        declarationLabel.textAlignment = .center
        declarationLabel.numberOfLines = 0
        declarationLabel.sizeToFit()
        declarationLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        declarationLabel.sizeToFit()
        declarationLabel.font = Font.custom(size: 12, fontWeight: .Light)
        view.addSubview(declarationLabel)
        declarationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(45)
            make.width.equalTo(300)
        }
    
        
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    
    func timerFunc() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                if Globals.resultVoiceURL != "" {
                    self.presentSongPlayingVC()
                    timer.invalidate() 
                }
            }
        }
        
        func presentSongPlayingVC() {
            if Globals.resultVoiceURL != "" {
                
                present(destinationVC: SecondHomeVC().songPlayingVC, slideDirection: .right)
            }
        }
}
