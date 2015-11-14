//
//  SLCategoryPickerViewController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLCategoryPickerViewController: UIViewController {
    var viewModel: SLCategoryPickerViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    @IBAction func doneBarItemAction(sender: AnyObject) {
        
    }
}

extension SLCategoryPickerViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Select Category Cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 0.2, green: 0.0, blue: 0.0, alpha: 0.5)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let viewModel = self.viewModel {
            return viewModel.categories.count
        } else {
            return 0
        }
    }
}

extension SLCategoryPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width - 60)/3, height: (self.view.frame.size.width - 60)/3)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
}