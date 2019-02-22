//
//  pinterestLayout.swift
//  prospectorProject
//
//  Created by period3 on 11/15/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// THIS IS UNUSED AT THE MOMENT - KAI
// Does not have an effect on parsing

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

class pinterestLayout: UICollectionViewLayout {

    // 1
    weak var delegate: PinterestLayoutDelegate!
    
    // 2
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 6
    
    // 3
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    // 4
    fileprivate var contentHeight: CGFloat = 0
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    // 5
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

}
