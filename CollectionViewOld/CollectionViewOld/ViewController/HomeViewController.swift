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

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {

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
    
    // Data for UICollectionViewDelegateFlowLayout set, from Tutorial
    private let numberOfItemsPerRow: CGFloat = 6
    private let interItemSpacing: CGFloat = 8
    
    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        return button
    }()
    private lazy var deleteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(deleteButtonClicked))
        button.isEnabled = false
        return button
    }()
    
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
        self.collectionView.delegate = self
        self.collectionView.allowsMultipleSelection = true
        
        self.navigationItem.rightBarButtonItems = [self.addButton, self.deleteButton]
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        self.makeConstraints()
    }

    func makeConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // show hide buttons
        self.deleteButton.isEnabled = self.isEditing
        self.addButton.isEnabled = !self.isEditing
        
        self.collectionView.indexPathsForVisibleItems.forEach {
            guard let emojiCell = self.collectionView.cellForItem(at: $0) as? EmojiCell else { return }
            emojiCell.isEditing = editing
        }
        
        if !self.isEditing {
            self.collectionView.indexPathsForSelectedItems?.compactMap( { $0 } ).forEach {
                self.collectionView.deselectItem(at: $0, animated: true)
            }
        }
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Functions
    
    @objc
    func addButtonClicked() {
        let (category, randomEmoji) = Emoji.randomEmoji()
        
        self.dataSource.addEmoji(randomEmoji, to: category)
        
        // dont use this, it reloads the entire collectionView: expensive operation in a real app and also
        // reloading cells that havent changed is wasteful
        // collectionView.reloadData()
        
        // only adding to the first section
        let emojiCount = collectionView.numberOfItems(inSection: 0)
        let insertedIndex = IndexPath(item: emojiCount, section: 0)
        self.collectionView.insertItems(at: [insertedIndex])
    }
    
    @objc
    func deleteButtonClicked() {
        
        guard let selectedIndices = self.collectionView.indexPathsForSelectedItems else { return }
        // determin which selection have been selected, iterate through selectedIndices and add it to a set
        let sectionsToDelete = Set(selectedIndices.map({ $0.section }))
        
        // take each section from the set and iterate again so that we get the indexpaths
        sectionsToDelete.forEach { section in
            let indexPathsForSection = selectedIndices.filter({ $0.section == section })
            
            // now sort it to descending order
            let sortedIndexPaths = indexPathsForSection.sorted(by: { $0.item > $1.item })
            
            self.dataSource.deleteEmojis(at: sortedIndexPaths)
            self.collectionView.deleteItems(at: sortedIndexPaths)
        }
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - UICollectionViewDelegateFlowLayout
    // /////////////////////////////////////////////////////////////////////////
    
    // calculation taken from tutorial -> copied
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let emoji = Emoji.shared.emoji(at: indexPath) {
            
            if !self.isEditing {
                
                let controller = EmojiDetailViewController(emoji: emoji)
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}

