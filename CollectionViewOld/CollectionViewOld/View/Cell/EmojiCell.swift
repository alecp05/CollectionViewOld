//
//  EmojiCell.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

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
    
    var isEditing: Bool = false

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.emojiLabel)
        self.backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - EmojiCell
    
    override var isSelected: Bool {
        didSet {
            if self.isEditing {
                self.backgroundColor = self.isSelected ? UIColor.systemRed.withAlphaComponent(0.5) : UIColor.systemGroupedBackground
            } else {
                self.backgroundColor = UIColor.systemGroupedBackground
            }
        }
    }
    
    func makeConstraints() {
        
        self.emojiLabel.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
    }
}
