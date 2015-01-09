//
//  ViewController.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 07/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var topCollectionView: UICollectionView!
    @IBOutlet var bottomCollectionView: UICollectionView!
    
    // MARK: Private
    
    private var topCollectionViewDataSource = HeartsCollectionViewDataSource()
    private var bottomCollectionViewDataSource = HeartsCollectionViewDataSource()
    
    // MARK: - Initialization
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCollectionViewDataSource.count = 13
        bottomCollectionViewDataSource.count = 7
        
        let nib = UINib(nibName: "HeartsCollectionViewCell", bundle: nil)
        topCollectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
        bottomCollectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
//        topCollectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
//        bottomCollectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        
        topCollectionView.delegate = topCollectionViewDataSource
        topCollectionView.dataSource = topCollectionViewDataSource
        bottomCollectionView.delegate = bottomCollectionViewDataSource
        bottomCollectionView.dataSource = bottomCollectionViewDataSource
        
        view.backgroundColor = UIColor(red:0.19, green:0.3, blue:0.42, alpha:1)
        
        topCollectionView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

