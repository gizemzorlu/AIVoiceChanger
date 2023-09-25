//
//  HomeVC.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 7.09.2023.
//

import UIKit
import NeonSDK
import SnapKit
import FirebaseAuth
import Firebase

class FirstHomeVC: UIViewController {
    
    let voiceTitleLabel = UILabel()
    let settingsButton = UIButton()
    var startLabel = UILabel()
    var phraseLabel = UILabel()
    let vectorImage = UIImageView()
    let generateButton = CustomGradientButton()
    let backButton = UIButton()
    
    let songTitleLabel = UILabel()
    let plusButton = UIButton()
    
    var userInfoArr: [SavedSongs] = []
    var uid: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if !Globals.songArr.isEmpty {
            self.createUI()
        } else {
            self.configureUI()
        }
        }
        print(Globals.songArr)
      
    }

    func configureUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        voiceTitleLabel.text = "AI Voices"
        voiceTitleLabel.textAlignment = .center
        voiceTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceTitleLabel.sizeToFit()
        voiceTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        view.addSubview(voiceTitleLabel)
        voiceTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.height.equalTo(28)
          
        }
        
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonClicked), for: .touchUpInside)
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(voiceTitleLabel)
            make.left.equalToSuperview().offset(36)
        }
    
        startLabel.text = "Start here"
        startLabel.textAlignment = .center
        startLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        startLabel.font = Font.custom(size: 34, fontWeight: .Bold)
        view.addSubview(startLabel)
        startLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceTitleLabel.snp.bottom).offset(228)
            make.width.equalTo(250)
            make.height.equalTo(41)
          
        }
        
        phraseLabel.text = "Generate a rap song in a few easy steps!"
        phraseLabel.textAlignment = .center
        phraseLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        phraseLabel.numberOfLines = 0
        phraseLabel.sizeToFit()
        phraseLabel.font = Font.custom(size: 17, fontWeight: .Light)
        view.addSubview(phraseLabel)
        phraseLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startLabel.snp.bottom).offset(20)
            make.width.equalTo(300)
           
        }
     
        vectorImage.image = UIImage(named: "arrow")
        view.addSubview(vectorImage)
        vectorImage.snp.makeConstraints { make in
            make.top.equalTo(phraseLabel.snp.bottom).offset(42)
            make.centerX.equalToSuperview()
            make.height.equalTo(185)
            make.width.equalTo(15)
        }
        
        generateButton.setTitle("Generate", for: .normal)
        generateButton.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
        generateButton.addTarget(self, action: #selector(generateButtonClicked), for: .touchUpInside)
        view.addSubview(generateButton)
        generateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(vectorImage.snp.bottom).offset(40)
            make.width.equalTo(350)
            make.height.equalTo(60)
        }
    }
    
    func createUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        songTitleLabel.text = "AI Voices"
        songTitleLabel.textAlignment = .center
        songTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        songTitleLabel.sizeToFit()
        songTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        view.addSubview(songTitleLabel)
        songTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.height.equalTo(28)
            
        }
        
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonClicked), for: .touchUpInside)
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(songTitleLabel)
            make.left.equalToSuperview().offset(36)
        }
        
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(songTitleLabel)
            make.right.equalToSuperview().offset(-36)
        }
        
                let songsCollectionView = NeonCollectionView<SavedSongs, SongsCollectionViewCell>(
                    objects: Globals.songArr ,
                    itemsPerRow: 1,
                    leftPadding: 0,
                    rightPadding: 0,
                    horizontalItemSpacing: 10,
                    verticalItemSpacing: 18,
                    heightForItem: 103
                )
                view.addSubview(songsCollectionView)
                songsCollectionView.snp.makeConstraints { make in
                    make.top.equalTo(songTitleLabel).offset(60)
                    make.right.equalToSuperview().inset(25)
                    make.left.equalToSuperview().offset(25)
                    make.bottom.equalToSuperview()
                }
        
                songsCollectionView.didSelect = { [self] object, indexPath in
                    
                    let vc = SongPlayingVC()
                    vc.savedVoiceURL = object.voiceURL
                    vc.voiceName.text = object.voiceName
                    vc.voiceImage.image = UIImage(named: object.voiceImage)
                    present(destinationVC: vc, slideDirection: .right)
                   
                    }

    }
        
    @objc func settingsButtonClicked() {
        present(destinationVC: SettingsVC(), slideDirection: .right)
    }
    
    @objc func generateButtonClicked() {
        present(destinationVC: SecondHomeVC(), slideDirection: .up)
        print(Globals.songArr.count)
    }
        
    @objc func plusButtonClicked() {
        present(destinationVC: SecondHomeVC(), slideDirection: .right)
    }

    }
