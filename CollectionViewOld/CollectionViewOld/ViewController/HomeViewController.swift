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
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    
    private let dataSource = DataSource()
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - HomeViewController
    // /////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: EmojiCell.reusidentifier)
        self.collectionView.dataSource = self.dataSource
        
        self.makeConstraints()
    }

    func makeConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

