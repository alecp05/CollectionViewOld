//
//  ViewController.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - HomeViewController -
// /////////////////////////////////////////////////////////////////////////

class HomeViewController: UIViewController {

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    // for this time, we will use UICollectionViewFlowLayout (linear placing/ linear path)
    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    
    private let dataSource = DataSource()
    private let delegate = EmojiCollectionViewDelegate(numberOfItemsPerRow: 6, interItemSpacing: 8)
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - HomeViewController
    // /////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: EmojiCell.reusidentifier)
        self.collectionView.register(EmojiHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EmojiHeaderView.reusidentifier)
        
        // set hight of headerView or the data source method will not get called
        self.layout.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: 50)
        
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self.delegate
        
        self.makeConstraints()
    }

    func makeConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

