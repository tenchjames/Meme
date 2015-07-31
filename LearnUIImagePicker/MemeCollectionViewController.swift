//
//  MemeCollectionViewController.swift
//  LearnUIImagePicker
//
//  Created by James Tench on 7/26/15.
//  Copyright (c) 2015 James Tench. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.registerClass(MemeDetailCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func launchNewMemeEditor(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("memeEditorController") as! MemeEditorViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectionViewShowDetailSegue" {
            let selectedCell = sender as! MemeDetailCollectionViewCell
            if let indexPath = collectionView?.indexPathForCell(selectedCell) {
                let meme = memes[indexPath.row]
                
                (segue.destinationViewController as! MemeDetailViewController).memeImage = meme.memedImage
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> MemeDetailCollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as! MemeDetailCollectionViewCell
        
        // Configure the cell
        let currentMeme = memes[indexPath.row]
        
        cell.memeImageView.image = currentMeme.memedImage
        return cell
    }

    // MARK: UICollectionViewDelegate
    // programatically performing segue to detail view
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = memes[indexPath.row]
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("memeDetailView") as! MemeDetailViewController
        controller.memeImage = meme.memedImage
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let edge = self.view.frame.width / 2 - 20
        return CGSizeMake(edge, edge)
    }
    

}
