//
//  HeartsCollectionViewLayout.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 09/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

@IBDesignable class HeartsCollectionViewLayout: UICollectionViewFlowLayout {
    
    // MARK: - Privates
    
    private var count = 0
    private var maximumRowItems = 0
    private var maximumRows = 0
    private var width: CGFloat = 0.0
    private var collectionItemSize = CGSizeZero
    private var itemSpacing: CGFloat = 0.0
    
    // MARK: Inspectables
    
    @IBInspectable var alignRight: Bool = false
    @IBInspectable var alignBottom: Bool = false
    
    // MARK: - UICollectionViewLayout
    
    override func prepareLayout() {
        super.prepareLayout()
        
        count = self.collectionView?.numberOfItemsInSection(0) ?? 0
        if let delegate = self.collectionView?.delegate as? HeartsCollectionViewDelegateFlowLayout {
            collectionItemSize = delegate.collectionViewItemSize(self.collectionView!, layout: self)
            itemSpacing = delegate.collectionViewInterItemSpacing(self.collectionView!, layout: self)
        }
        width = (self.collectionView?.frame.size.width ?? 0.0)
        maximumRowItems = Int(width / (collectionItemSize.width + itemSpacing))
        maximumRows = Int(floor(Float(count) / Float(maximumRowItems)))
    }
    
    override func collectionViewContentSize() -> CGSize {
        let totalRows = ceilf(Float(count) / Float(maximumRowItems))
        return CGSizeMake(width, CGFloat(totalRows) * (collectionItemSize.height + itemSpacing) - itemSpacing)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        let layoutAttributes = super.layoutAttributesForElementsInRect(rect)
        for attributes in layoutAttributes as [UICollectionViewLayoutAttributes] {
            if attributes.representedElementKind == nil {
                attributes.frame = self.layoutAttributesForItemAtIndexPath(attributes.indexPath).frame
            }
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        let currentAttributes = super.layoutAttributesForItemAtIndexPath(indexPath)
        
        // Set the correct x value.
        var x: CGFloat = 0.0
        if alignRight {
            let column = CGFloat(maximumRowItems - indexPath.item % maximumRowItems)
            x = (collectionItemSize.width + itemSpacing) * CGFloat(column) - itemSpacing
        } else {
            let column = CGFloat(indexPath.item % maximumRowItems)
            x = (collectionItemSize.width + itemSpacing) * CGFloat(column)
        }
        currentAttributes.frame.origin.x = x
        
        var row: Float = 0.0
        // Set the correct y value.
        if alignBottom {
            row = Float(maximumRows) - floor(Float(indexPath.item) / Float(maximumRowItems))
        } else {
            row = Float(floor(CGFloat(indexPath.item) / CGFloat(maximumRowItems)))
        }
        let y = CGFloat(row) * (collectionItemSize.height + itemSpacing)
        currentAttributes.frame.origin.y = y
        
        return currentAttributes
    }
    
}