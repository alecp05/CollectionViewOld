//
//  EmojiCell.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import Foundation
import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - EmojiCell -
// /////////////////////////////////////////////////////////////////////////

class EmojiCell: UICollectionViewCell {

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    var emojiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.emojiLabel)
        
        self.makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - EmojiCell
    
    func makeConstraints() {
        
        self.emojiLabel.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
    }
}
