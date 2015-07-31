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
    
    var memes: [Meme]!
    var memeIndex: Int?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        if let index = memeIndex {
            let meme = memes[index]
            memeImageView.image = meme.memedImage
            let deleteIcon = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: "deleteMemeAtIndex")
            self.navigationItem.rightBarButtonItem = deleteIcon
        } 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteMemeAtIndex() {
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        if let index = memeIndex {
            applicationDelegate.memes.removeAtIndex(index)
            self.navigationController?.popViewControllerAnimated(true)
        }
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
