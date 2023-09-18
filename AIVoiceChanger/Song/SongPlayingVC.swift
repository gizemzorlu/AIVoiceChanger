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
import AVKit

class SongPlayingVC: UIViewController {
    
    var player: AVPlayer?
    var timeObserver: Any?
    
    let voiceTitleLabel = UILabel()
    let backButton = UIButton()
    let nextButton = UIButton()
    var firstTimeClicked = false
    var timer = Timer()
    
    let voiceView = UIView()
    var voiceImage = UIImageView()
    var voiceLabel = UILabel()
    var voiceName = UILabel()
    
    let playImageView = UIImageView()
    let progressBar = UISlider()
    let playButton = UIButton()
    let undoButton = UIButton()
    let rewindButton = UIButton()
    let currentTimeLabel = UILabel()
    let totalTimeLabel = UILabel()
    
    var countTime = 0
    
    
    
    let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        
        if let globalURL = URL(string: Globals.resultVoiceURL) {
            loadSong(songURL: globalURL.absoluteString)
        }
        
        
        
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
        
        nextButton.setImage(UIImage(systemName: "arrowshape.forward"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(voiceTitleLabel)
            make.right.equalToSuperview().offset(-36)
            
        }
        
        
        voiceView.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        voiceView.layer.cornerRadius = 75
        voiceView.layer.borderWidth = 6
        voiceView.layer.borderColor = UIColor(red: 0.70, green: 0.47, blue: 1.00, alpha: 1.00).cgColor
        voiceView.clipsToBounds = true
        voiceView.contentMode = .scaleAspectFit
        voiceView.clipsToBounds = true
        
        view.addSubview(voiceView)
        voiceView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(voiceTitleLabel.snp.bottom).offset(37)
            make.width.equalTo(152)
            make.height.equalTo(163)
        }
        
        
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
        
        progressBar.minimumTrackTintColor = UIColor(red: 0.70, green: 0.47, blue: 1.00, alpha: 1.00)
        progressBar.setThumbImage(UIImage(named: "thumbimage"), for: .normal)
        progressBar.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        progressBar.maximumTrackTintColor = .black
        progressBar.layer.cornerRadius = 3
        progressBar.layer.masksToBounds = true
        progressBar.minimumValue = 0
        progressBar.maximumValue = 100
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(voiceName.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(6)
        }
        
        currentTimeLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        currentTimeLabel.backgroundColor = .systemBackground
        currentTimeLabel.textAlignment = .left
        currentTimeLabel.font = Font.custom(size: 11, fontWeight: .Medium)
        view.addSubview(currentTimeLabel)
        currentTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(progressBar)
            make.top.equalTo(progressBar.snp.bottom).offset(15)
            make.width.equalTo(40)
            make.height.equalTo(15)
        }
        
        totalTimeLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        totalTimeLabel.backgroundColor = .systemBackground
        totalTimeLabel.textAlignment = .right
        totalTimeLabel.font = Font.custom(size: 11, fontWeight: .Light)
        view.addSubview(totalTimeLabel)
        totalTimeLabel.snp.makeConstraints { make in
            make.right.equalTo(progressBar)
            make.top.equalTo(progressBar.snp.bottom).offset(15)
            make.width.equalTo(40)
            make.height.equalTo(15)
        }
        
        undoButton.setImage(UIImage(named: "undo"), for: .normal)
        undoButton.addTarget(self, action: #selector(forwardButtonClicked), for: .touchUpInside)
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
    
    func loadSong(songURL: String) {
        guard let url = URL.init(string: songURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player?.play()
    }
    
    @objc func updateSlider() {
        guard (player?.currentItem!.duration) ?? CMTime(value: 0, timescale: 10000) >= .zero, ((player?.currentItem!.duration.seconds.isNaN) == false) else { return }
        let songTime = CMTimeGetSeconds((player?.currentItem!.duration) ?? CMTime(value: 0, timescale: 10000))
        progressBar.maximumValue = Float(Int(songTime))
        
        progressBar.setValue(Float(Int(CMTimeGetSeconds((player?.currentTime()) ?? CMTime(value: 0, timescale: 10000)))), animated: true)
        var (m, s) = secondsToMinutesSeconds(Int(progressBar.maximumValue))
        if s < 10 {
            totalTimeLabel.attributedText = NSAttributedString(string: "\(m):0\(s)", attributes: [.font: UIFont(name: "Poppins", size: 11)])
        } else {
            totalTimeLabel.attributedText = NSAttributedString(string: "\(m):\(s)", attributes: [.font: UIFont(name: "Poppins", size: 11)])
        }
        
        var (i, k) = secondsToMinutesSeconds(Int(progressBar.value))
        if k < 10 {
            currentTimeLabel.attributedText = NSAttributedString(string: "\(i):0\(k)", attributes: [.font: UIFont(name: "Poppins", size: 11)])
        } else {
            currentTimeLabel.attributedText = NSAttributedString(string: "\(i):\(k)", attributes: [.font: UIFont(name: "Poppins", size: 11)])
        }
    }
    
    @objc func playButtonClicked() {
        if self.playButton.currentImage == UIImage(named: "playview") && firstTimeClicked == false {
            firstTimeClicked = true
            self.playButton.setImage(UIImage(named: "btn_pauseSong"), for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        } else if self.playButton.currentImage == UIImage(named: "playview") && firstTimeClicked == true {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            self.playButton.setImage(UIImage(named: "btn_pauseSong"), for: .normal)
            player?.play()
        } else if self.playButton.currentImage == UIImage(named: "btn_pauseSong") {
            timer.invalidate()
            self.playButton.setImage(UIImage(named: "playview"), for: .normal)
            player?.pause()
        }
    }
    func secondsToMinutesSeconds(_ seconds: Int) -> (Int, Int) {
        return (seconds / 60, seconds % 60)
    }
    
    @objc func sliderChanged(sender: UISlider) {
        var newTime = Float64(sender.value)
        let time2: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
        player!.seek(to: time2, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
    }
    
    @objc func forwardButtonClicked() {
        let seekDuration: Float64 = 15
        guard let duration = player?.currentItem?.duration else {
            return
        }
        let playerCurrentTime = CMTimeGetSeconds(player!.currentTime())
        let newTime = playerCurrentTime + seekDuration
        
        if newTime < (CMTimeGetSeconds(duration) - seekDuration) {
            
            let time2: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
            player!.seek(to: time2, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
            
        }
    }
    
    @objc func rewindButtonClicked() {
        let seekDuration: Float64 = 15
        let playerCurrentTime = CMTimeGetSeconds(player!.currentTime())
        var newTime = playerCurrentTime - seekDuration
        
        if newTime < 0 {
            newTime = 0
        }
        let time2: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
        player!.seek(to: time2, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
        player?.pause()
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
    
    @objc func nextButtonClicked() {
        
        //        present(destinationVC:AllSongsVC(), slideDirection: .right)
        //    }
        
    }
}



