//
//  MemeTableViewController.swift
//  LearnUIImagePicker
//
//  Created by James Tench on 7/27/15.
//  Copyright (c) 2015 James Tench. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        
        // so the table refreshes after returning from another screen
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // set custom hight for table view row cell
        tableView.rowHeight = 80
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MemeDetailTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell", forIndexPath: indexPath) as! MemeDetailTableViewCell
        let currentMeme = memes[indexPath.row]
        
        cell.memeImageView.image = currentMeme.memedImage
        cell.topTextLabel.text = currentMeme.topText
        cell.bottomTextLabel.text = currentMeme.bottomText
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tableViewShowDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                let meme = memes[indexPath.row]
                (segue.destinationViewController as! MemeDetailViewController).memeImage = meme.memedImage
            }
        }
    }
    
    @IBAction func launchNewMemeEditor(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("memeEditorController") as! MemeEditorViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    

}
