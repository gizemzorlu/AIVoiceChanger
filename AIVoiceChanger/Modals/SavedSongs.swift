//
//  SavedSongs.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 18.09.2023.
//

public class SavedSongs {

    var id: String
    var voiceName: String
    var voiceImage: String
    var promptText: String
    var voiceURL: String
    var selectedVoiceUUID: String
   
    init(id: String, voiceName: String, voiceImage: String, promptText: String, voiceURL: String, selectedVoiceUUID: String) {
        self.id = id
        self.voiceName = voiceName
        self.voiceImage = voiceImage
        self.promptText = promptText
        self.voiceURL = voiceURL
        self.selectedVoiceUUID = selectedVoiceUUID
    }

}
