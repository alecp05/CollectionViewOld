//
//  UICollectionViewCell.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import Foundation
import UIKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - UICollectionViewCell.Extension -
// /////////////////////////////////////////////////////////////////////////

public extension UICollectionViewCell {
    
    static var reusidentifier: String {
        return String(describing: self)
    }
}
