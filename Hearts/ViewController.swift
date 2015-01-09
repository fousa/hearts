//
//  ViewController.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 07/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HeartsCollectionViewDataSourceDelegate, UIPopoverPresentationControllerDelegate {
    
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
        
        topCollectionViewDataSource.delegate = self
        topCollectionViewDataSource.count = 13
        bottomCollectionViewDataSource.delegate = self
        bottomCollectionViewDataSource.count = 7
        
        let nib = UINib(nibName: "HeartsCollectionViewCell", bundle: nil)
        topCollectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
        bottomCollectionView.registerNib(nib, forCellWithReuseIdentifier: "Cell")
        
        topCollectionView.delegate = topCollectionViewDataSource
        topCollectionView.dataSource = topCollectionViewDataSource
        bottomCollectionView.delegate = bottomCollectionViewDataSource
        bottomCollectionView.dataSource = bottomCollectionViewDataSource
        
        view.backgroundColor = UIColor(red:0.19, green:0.3, blue:0.42, alpha:1)
        
        topCollectionView.reloadData()
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    // MARK: - HeartsCollectionViewDataSourceDelegate
    
    func heartsCollectionView(collectionView: HeartsCollectionView, didPressHeart hearCell: Int, withCell cell: UICollectionViewCell) {
        var controller = PopoverViewController(nibName: "PopoverViewController", bundle: nil)
        controller.preferredContentSize = CGSizeMake(100, 40.0)
        controller.modalPresentationStyle = .Popover
        
        let popoverController = controller.popoverPresentationController
        popoverController?.sourceView = collectionView
        popoverController?.sourceRect = collectionView.convertRect(cell.frame, toView: collectionView)
        
        popoverController?.sourceRect = CGRectOffset(popoverController!.sourceRect, -2, 0.0)
        
        println("-- rect \(popoverController?.sourceRect)")
        
        popoverController?.permittedArrowDirections = .Down | .Up
        popoverController?.delegate = self
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

