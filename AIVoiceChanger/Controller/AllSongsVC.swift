//
//  SongsVC.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 14.09.2023.
//

//import UIKit
//import NeonSDK
//
//class AllSongsVC: UIViewController {
//
//    var songsCollectionView : SongsCollectionView!
//    
//    let voiceTitleLabel = UILabel()
//    let settingsButton = UIButton()
//    let plusButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//       createUI()
//    }
//    
//    func createUI() {
//        
//        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
//        
//        voiceTitleLabel.text = "AI Voices"
//        voiceTitleLabel.textAlignment = .center
//        voiceTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
//        voiceTitleLabel.sizeToFit()
//        voiceTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
//        view.addSubview(voiceTitleLabel)
//        voiceTitleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(100)
//            make.width.equalTo(150)
//            make.height.equalTo(28)
//          
//        }
//        
//        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
//        settingsButton.addTarget(self, action: #selector(settingsButtonClicked), for: .touchUpInside)
//        view.addSubview(settingsButton)
//        settingsButton.snp.makeConstraints { make in
//            make.top.equalTo(voiceTitleLabel)
//            make.left.equalToSuperview().offset(36)
//        }
//        
//        plusButton.setImage(UIImage(named: "plus"), for: .normal)
//        plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
//        view.addSubview(plusButton)
//        plusButton.snp.makeConstraints { make in
//            make.top.equalTo(voiceTitleLabel)
//            make.right.equalToSuperview().offset(-36)
//        }
//        
////        songsCollectionView = songsCollectionView(didSelect: { object, IndexPath in
////        
//// 
////        })
////        view.addSubview(songsCollectionView)
////        songsCollectionView.snp.makeConstraints { make in
////            make.top.equalTo(songTitleLabel).offset(12)
////            make.right.equalToSuperview().offset(25)
////            make.left.equalToSuperview().inset(25)
////        }
//    }
//    
//    @objc func settingsButtonClicked() {
//        present(destinationVC: SettingsVC(), slideDirection: .right)
//    }
//
//    @objc func plusButtonClicked() {
//        present(destinationVC: SecondHomeVC(), slideDirection: .right)
//    }
//    
//
//}