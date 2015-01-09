//
//  HeartsCollectionViewDataSource.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 07/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class HeartsCollectionViewDataSource: NSObject, UICollectionViewDataSource, HeartsCollectionViewDelegateFlowLayout {
    
    // MARK: - Public
    
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
    
    func collectionViewInterItemSpacing(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGFloat {
        return 5.0
    }

}
