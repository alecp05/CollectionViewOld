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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let emojiHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiHeaderView.reusidentifier, for: indexPath) as? EmojiHeaderView else {
            fatalError("Could not create EmojiHeaderView")
        }
        
        let category = emoji.sections[indexPath.section]
        emojiHeaderView.textLabel.text = category.rawValue
        
        return emojiHeaderView
    }
}

// /////////////////////////////////////////////////////////////////////////
// MARK: - DataSource.Extension -
// /////////////////////////////////////////////////////////////////////////

// in extension to keep it seperated from datasourceprotocol methods
extension DataSource {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Functions
    
    func addEmoji(_ emoji: String, to category: Emoji.Category) {
        guard var emojiData = self.emoji.data[category] else { return }
        
        emojiData.append(emoji)
        
        self.emoji.data.updateValue(emojiData, forKey: category)
    }
}
