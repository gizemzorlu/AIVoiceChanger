//
//  VoicesCollectionView.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 13.09.2023.
//

import UIKit
import NeonSDK

class VoicesCollectionView: NeonCollectionView<VoicesModal, VoicesCollectionViewCell> {
    
    convenience init(didSelect: ((VoicesModal, IndexPath) -> Void)?) {
        self.init(
            objects: Globals.arrVoices,
            itemsPerRow: 4,
            leftPadding: 0,
            rightPadding: 0,
            horizontalItemSpacing: 19,
            verticalItemSpacing: 12,
            heightForItem: 90
        )
        
        
        self.didSelect = didSelect
        
    }

    
}
