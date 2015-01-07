//
//  HeartsCollectionView.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 07/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class HeartsCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !CGSizeEqualToSize(self.bounds.size, self.intrinsicContentSize()) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return self.contentSize
    }

}