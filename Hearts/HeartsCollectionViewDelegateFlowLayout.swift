//
//  HeartsCollectionViewDelegateFlowLayout.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 09/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

@objc protocol HeartsCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    func collectionViewInterItemSpacing(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGFloat
    func collectionViewItemSize(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout) -> CGSize
}