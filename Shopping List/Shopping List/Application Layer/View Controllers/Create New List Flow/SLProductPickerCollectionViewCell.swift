//
//  SLProductPickerCollectionViewCell.swift
//  Shopping List
//
//  Created by Pavel Gatilov on 11/14/15.
//  Copyright © 2015 Pavel Gatilov. All rights reserved.
//

import UIKit

class SLProductPickerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    static func identifier() -> String {
        return "SLProductPickerCollectionViewCell"
    }
    
    static func xibName() -> String {
        return "SLProductPickerCollectionViewCell"
    }
}
