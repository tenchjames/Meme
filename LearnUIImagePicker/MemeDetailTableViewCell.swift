//
//  MemeDetailTableViewCell.swift
//  LearnUIImagePicker
//
//  Created by James Tench on 7/27/15.
//  Copyright (c) 2015 James Tench. All rights reserved.
//

import UIKit

class MemeDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
