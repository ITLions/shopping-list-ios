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
    
    func animateCellItemToList(collectionView: UICollectionView, cell: UICollectionViewCell?) {
        // Convert cell origin point postion from position on collectionView to position on self.view
        let convertedOrigin = self.view.convertPoint((cell?.frame.origin)!, fromView: collectionView)
        // Set destination point of animation
        let tabBarItemPosition = CGPointMake(self.view.frame.size.width - 80, self.view.frame.size.height + 84)
        // Convert destination point position from position on self.view to position on collectionView
        let convertedTabBarItemPosition = collectionView.convertPoint(tabBarItemPosition, fromView: self.view)
        // Take a snapshot of cell and create a UIImage
        UIGraphicsBeginImageContext((cell?.bounds.size)!);
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        cell?.layer.renderInContext(context)
        let cellSnapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageSize = cellSnapshotImage.size
        // Create UIImageView and add it to self.view
        let snapshotImageView: UIImageView = UIImageView.init(image: cellSnapshotImage)
        snapshotImageView.frame = CGRectMake(convertedOrigin.x, convertedOrigin.y, (cell?.frame.size.width)!, (cell?.frame.size.height)!)
        self.view.addSubview(snapshotImageView)
        // Set animation parameters
        UIView.animateWithDuration(1, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            // Set destination point. It will be 'list tabBarItem' postion
            snapshotImageView.frame = CGRectMake(convertedTabBarItemPosition.x, convertedTabBarItemPosition.y, imageSize.width/2, imageSize.height/2)
            }, completion: {_ in
                snapshotImageView.removeFromSuperview()
        })
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
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        animateCellItemToList(collectionView, cell: cell!)
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
