//
//  EmojiDetailViewController.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - EmojiDetailViewController -
// /////////////////////////////////////////////////////////////////////////

class EmojiDetailViewController: UIViewController {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    var emoji: String
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    init(emoji: String) {
        self.emoji = emoji
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - EmojiDetailViewController -
    // /////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.titleLabel.text = emoji
        
        self.view.addSubview(self.titleLabel)
        
        self.makeConstraints()
    }
    
    func makeConstraints() {
        
        self.titleLabel.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
    }
    
}
