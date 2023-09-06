//
//  DataSource.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - DataSource -
// /////////////////////////////////////////////////////////////////////////

class DataSource: NSObject, UICollectionViewDataSource {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    let emoji = Emoji.shared
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - UICollectionViewDataSource
    // /////////////////////////////////////////////////////////////////////////
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return emoji.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = emoji.sections[section]
        let numberOfItems = self.emoji.data[category]?.count ?? 0
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let emojiCell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reusidentifier, for: indexPath) as? EmojiCell else {
            fatalError("Cell cannot be created")
        }
        
        let category = emoji.sections[indexPath.section]
        if let emoji = self.emoji.data[category]?[indexPath.item] {
            emojiCell.emojiLabel.text = emoji
        }
        
        return emojiCell
    }
}
