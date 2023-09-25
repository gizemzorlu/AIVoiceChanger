//
//  GetDataFirestore.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 20.09.2023.
//

import Foundation
import Firebase

public class GetDataFirestore {
    
    static func getDataFromFirestore() {
        
        let fireStoreDatabase = Firestore.firestore()
        fireStoreDatabase.collection("Songs").order(by: "createdAt", descending: true).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Firestore Hata: \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else {
                print("Firestore'dan veri alınamadı.")
                return
            }
            Globals.songArr.removeAll(keepingCapacity: false)
            print(snapshot.documents)
            for document in snapshot.documents {
                if let id = document.documentID as? String, // Belge kimlik bilgisini al
                   let voiceName = document.get("voiceName") as? String,
                   let voiceImage = document.get("voiceImage") as? String,
                   let promptText = document.get("promptText") as? String,
                   let voiceURL = document.get("voiceURL") as? String,
                   let selectedVoiceUUID = document.get("selectedVoiceUUID") as? String {
                    
                    var savedSong = SavedSongs(id: id, voiceName: voiceName, voiceImage: voiceImage, promptText: promptText, voiceURL: voiceURL, selectedVoiceUUID: selectedVoiceUUID)
                    Globals.songArr.append(savedSong)
                    print(Globals.songArr.count)
                }
            }
        }
    }
}
