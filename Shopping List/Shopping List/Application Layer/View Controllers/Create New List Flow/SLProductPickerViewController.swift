//
//  SLProductPickerViewController.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 16/10/2015.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLProductPickerViewController: UIViewController {
    var viewModel: SLProductPickerViewModel?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.registerNib(UINib(nibName: SLProductPickerCollectionViewCell.xibName(), bundle: nil), forCellWithReuseIdentifier: SLProductPickerCollectionViewCell.identifier())
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}

extension SLProductPickerViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SLProductPickerCollectionViewCell.identifier(), forIndexPath: indexPath) as! SLProductPickerCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.0, alpha: 0.5)
        
        if let product = self.viewModel?.products[indexPath.row] {
            cell.productNameLabel.text = product.productName
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let viewModel = self.viewModel {
            return viewModel.products.count
        } else {
            return 0
        }
    }
}

extension SLProductPickerViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}

extension SLProductPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width - 60)/3, height: (self.view.frame.size.width - 60)/3)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
}
