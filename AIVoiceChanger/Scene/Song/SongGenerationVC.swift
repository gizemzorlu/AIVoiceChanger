//
//  HomeVC3.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 9.09.2023.
//

import UIKit
import NeonSDK
import Firebase

class SongGenerationVC: UIViewController {
    
    let generatingTitleLabel = UILabel()
    let declarationLabel = UILabel()
    let vc = SongPlayingVC()
    var selectedVoiceImage = ""
    var selectedVoiceName = ""
    
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
                
                vc.voiceImage.image = UIImage(named: selectedVoiceImage)
                vc.voiceName.text = selectedVoiceName
                vc.savedVoiceURL = Globals.resultVoiceURL
                present(destinationVC: vc, slideDirection: .right)
                uploadFirebase()
                Globals.choosenUUID = ""
                GetDataFirestore.getDataFromFirestore()
            }
        }
    
    func uploadFirebase() {
        
        let db = Firestore.firestore()
        
        let data: [String: Any] = [
            "id": UUID().uuidString,
            "voiceName": Globals.choosenName,
            "voiceImage": Globals.choosenImage,
            "promptText": Globals.promptText,
            "voiceURL": Globals.resultVoiceURL,
            "createdAt": FieldValue.serverTimestamp(),
            "selectedVoiceUUID": Globals.choosenUUID,
        ]
        
        db.collection("Songs").addDocument(data: data) { error in
            if let error = error {
                print("Firestore veri ekleme hatası: \(error.localizedDescription)")
            } else {
                print("Firestore veri eklendi.")
            }
        }
    }
}
