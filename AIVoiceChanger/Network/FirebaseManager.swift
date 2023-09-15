//
//  FirebaseManager.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 15.09.2023.
//

import Foundation
import Firebase
import AVFoundation
import Firebase
import FirebaseStorage

class FirebaseManager {

    static let shared = FirebaseManager()

    private init() {}

    func playAudioFromFirebaseStorage(completion: @escaping (AVPlayer?) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let audioRef = storageRef.child("coinssound2.mp3")

        audioRef.downloadURL { url, error in
            if let error = error {
                print("Ses dosyasını indirme hatası: \(error)")
                completion(nil)
            } else if let audioURL = url {
                let playerItem = AVPlayerItem(url: audioURL)
                let player = AVPlayer(playerItem: playerItem)
                completion(player)
            } else {
                completion(nil)
            }
        }
    }
}

