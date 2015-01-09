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
    private var width: CGFloat = 0.0
    private var itemWidth: CGFloat = 0.0
    private var itemSpacing: CGFloat = 0.0
    
    // MARK: Inspectables
    
    @IBInspectable var alignRight: Bool = false
    @IBInspectable var alignBottom: Bool = false
    
    // MARK: - UICollectionViewLayout
    
    override func prepareLayout() {
        super.prepareLayout()
        
        count = self.collectionView?.numberOfItemsInSection(0) ?? 0
        width = (self.collectionView?.frame.size.width ?? 0.0)
        itemWidth = 30.0
        itemSpacing = 5.0
        maximumRowItems = Int(width / (itemWidth + itemSpacing))
    }
    
    override func collectionViewContentSize() -> CGSize {
        let totalRows = round(Float(count) / Float(maximumRowItems))
        return CGSizeMake(width, CGFloat(totalRows) * (itemWidth + itemSpacing))
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
        let correctHorizontalAlignment = alignRight ? indexPath.item : (count - indexPath.item)
        let column = Int(correctHorizontalAlignment) % maximumRowItems
        let x = width - itemWidth - (itemWidth + itemSpacing) * CGFloat(column)  - itemSpacing
        currentAttributes.frame.origin.x = x
        
        // Set the correct y value.
        let correctVerticalAlignment = alignBottom ? (count - indexPath.item): indexPath.item
        let row = correctVerticalAlignment / maximumRowItems
        let y = CGFloat(row) * (itemWidth + itemSpacing)
        currentAttributes.frame.origin.y = y
        
        return currentAttributes
    }
    
}