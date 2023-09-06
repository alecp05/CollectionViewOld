//
//  EmojiCollectionViewDelegate.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - EmojiCollectionViewDelegate -
// /////////////////////////////////////////////////////////////////////////

class EmojiCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    let numberOfItemsPerRow: CGFloat
    let interItemSpacing: CGFloat
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    init(numberOfItemsPerRow: CGFloat, interItemSpacing: CGFloat) {
        self.numberOfItemsPerRow = numberOfItemsPerRow
        self.interItemSpacing = interItemSpacing
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - EmojiCollectionViewDelegate
    // /////////////////////////////////////////////////////////////////////////
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.width
        let totalSpacing = self.interItemSpacing * self.numberOfItemsPerRow
        
        let itemWidth = (maxWidth - totalSpacing)/self.numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing = self.interItemSpacing/2
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: spacing, right: 0)
        } else {
            return UIEdgeInsets(top: spacing, left: 0, bottom: spacing, right: 0)
        }
    }
}
