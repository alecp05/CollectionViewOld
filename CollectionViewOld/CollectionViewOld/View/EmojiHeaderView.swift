//
//  EmojiHeaderView.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - EmojiHeaderView -
// /////////////////////////////////////////////////////////////////////////

class EmojiHeaderView: UICollectionReusableView {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    var textLabel: UILabel = UILabel()
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.textLabel)
        self.makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - EmojiHeaderView
    // /////////////////////////////////////////////////////////////////////////
    
    func makeConstraints() {
        
        self.textLabel.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
    }
    
}
