//
//  SLCategoryPickerCollectionViewCell.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/14/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLCategoryPickerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!

    static func identifier() -> String {
        return "SLCategoryPickerCollectionViewCell"
    }
    
    static func xibName() -> String {
        return "SLCategoryPickerCollectionViewCell"
    }
}
