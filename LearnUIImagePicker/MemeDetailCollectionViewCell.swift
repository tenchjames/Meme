//
//  MemeDetailCollectionViewCell.swift
//  LearnUIImagePicker
//
//  Created by James Tench on 7/28/15.
//  Copyright (c) 2015 James Tench. All rights reserved.
//

import UIKit

class MemeDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var memeImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        memeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        memeImage.contentMode = UIViewContentMode.ScaleAspectFill
        contentView.addSubview(memeImage)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
