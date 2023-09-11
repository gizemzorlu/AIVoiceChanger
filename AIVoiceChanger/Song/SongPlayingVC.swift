//
//  SongPlayingVC.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 10.09.2023.
//

import UIKit
import NeonSDK
import SnapKit
import AVFoundation

class SongPlayingVC: UIViewController {
    
    
    let voiceTitleLabel = UILabel()
    let backButton = UIButton()
    
    let voiceView = UIView()
    var voiceImage = UIImageView()
    var voiceLabel = UILabel()
    var voiceName = UILabel()
    
    let playImageView = UIImageView()
    let playButton = UIButton()
    let undoButton = UIButton()
    let rewindButton = UIButton()
    
    let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
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
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(voiceTitleLabel)
            make.left.equalToSuperview().offset(36)
            
        }
        
        voiceView.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        voiceView.layer.cornerRadius = 75
        voiceView.clipsToBounds = true
        
        view.addSubview(voiceView)
        voiceView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceTitleLabel.snp.bottom).offset(37)
            make.width.equalTo(152)
            make.height.equalTo(163)
        }
        
        
        voiceImage.image = UIImage(named: "trump")
        voiceView.addSubview(voiceImage)
        
        voiceImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(180)
            
        }
        
        voiceLabel.text = "AI Voice"
        voiceLabel.textAlignment = .center
        voiceLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceLabel.font = Font.custom(size: 17, fontWeight: .Light)
        
        view.addSubview(voiceLabel)
        voiceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceView.snp.bottom).offset(40)
            make.width.equalTo(80)
            make.height.equalTo(22)
            
        }
        
        voiceName.text = "Trump"
        voiceName.textAlignment = .center
        voiceName.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceName.font = Font.custom(size: 22, fontWeight: .Bold)
        voiceName.sizeToFit()
        
        view.addSubview(voiceName)
        voiceName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceLabel.snp.bottom).offset(5)
            make.height.equalTo(28)
            
        }
        
        undoButton.setImage(UIImage(named: "undo"), for: .normal)
        undoButton.addTarget(self, action: #selector(undoButtonClicked), for: .touchUpInside)
        
        view.addSubview(undoButton)
        undoButton.snp.makeConstraints { make in
            make.top.equalTo(voiceName).offset(121)
            make.left.equalToSuperview().offset(78)
        }
        
        rewindButton.setImage(UIImage(named: "rewind"), for: .normal)
        rewindButton.addTarget(self, action: #selector(rewindButtonClicked), for: .touchUpInside)
        
        view.addSubview(rewindButton)
        rewindButton.snp.makeConstraints { make in
            make.top.equalTo(voiceName).offset(121)
            make.right.equalToSuperview().inset(78)
        }
        
        
        playButton.setImage(UIImage(named: "playview"), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
        
        view.addSubview(playButton)
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceName).offset(100)
            make.width.equalTo(80)
            make.height.equalTo(99)
        
        }
        
        playImageView.image = UIImage(named: "play")
        playButton.addSubview(playImageView)
        
        playImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
            make.width.equalTo(33)
            make.height.equalTo(43)
            
        }
        
        
        shareButton.setTitle("Share", for: .normal)
        shareButton.titleLabel?.font = Font.custom(size: 17, fontWeight: .Medium)
        shareButton.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        shareButton.setTitleColor(UIColor(red: 0.47, green: 0.39, blue: 1.00, alpha: 1.00), for: .normal)
        shareButton.layer.cornerRadius = 30
        shareButton.layer.borderWidth = 2
        shareButton.layer.borderColor = UIColor(red: 0.31, green: 0.34, blue: 1.00, alpha: 1.00).cgColor
        shareButton.addTarget(self, action: #selector(shareButtonClicked), for: .touchUpInside)
        
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(65)
            make.width.equalTo(350)
            make.height.equalTo(60)
        }
        
        
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func shareButtonClicked()  {
        
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
    
    @objc func undoButtonClicked() {
        
        
    }
    
    @objc func rewindButtonClicked() {
    
    }
    
    @objc func playButtonClicked() {
        
        print("play button clicked")
    
    }

    }
