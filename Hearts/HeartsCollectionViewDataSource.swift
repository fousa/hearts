//
//  HeartsCollectionViewDataSource.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 07/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

protocol HeartsCollectionViewDataSourceDelegate {
    func heartsCollectionView(collectionView: HeartsCollectionView, didPressHeart heartIndex: Int, withCell cell: UICollectionViewCell)
}

class HeartsCollectionViewDataSource: NSObject, UICollectionViewDataSource, HeartsCollectionViewDelegateFlowLayout {
    
    // MARK: - Public
    
    var delegate: HeartsCollectionViewDataSourceDelegate?
    var count: Int = 0
    
    // MARK: - UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(23.0, 23.0)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        self.delegate?.heartsCollectionView(collectionView as HeartsCollectionView, didPressHeart: indexPath.item, withCell: cell)
    }
    
    func collectionViewItemSize(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGSize {
        return CGSizeMake(23.0, 23.0)
    }
    
    func collectionViewInterItemSpacing(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGFloat {
        return 10.0
    }

}
