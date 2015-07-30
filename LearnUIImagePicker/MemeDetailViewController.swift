//
//  MemeDetailViewController.swift
//  LearnUIImagePicker
//
//  Created by James Tench on 7/29/15.
//  Copyright (c) 2015 James Tench. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    @IBOutlet weak var memeImageView: UIImageView!

    var memeImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // expececting an image passed
        if let memeImage = memeImage {
            memeImageView.image = memeImage
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
