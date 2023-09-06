//
//  File.swift
//  CollectionViewOld
//
//  Created by Alec on 06.09.23.
//

import UIKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - UICollectionReusableView.Extension -
// /////////////////////////////////////////////////////////////////////////

public extension UICollectionReusableView {
    
    static var reusidentifier: String {
        return String(describing: self)
    }
}
