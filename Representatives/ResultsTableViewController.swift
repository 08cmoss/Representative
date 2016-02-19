//
//  ResultsTableViewController.swift
//  Representatives
//
//  Created by Cameron Moss on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var state: String?
    var representative: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.representative.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath)
        
        
        let rep = self.representative[indexPath.row]
        
        if let name = rep.name, party = rep.party {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = party
            if party == "I" {
                cell.detailTextLabel?.textColor = UIColor.yellowColor()
            } else if party == "D" {
                cell.detailTextLabel?.textColor = UIColor.blueColor()
            } else if party == "R" {
                cell.detailTextLabel?.textColor = UIColor.redColor()
            }
        }

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailSegue" {
            guard let cell = sender as? UITableViewCell else { return }
            
            let indexPath = self.tableView.indexPathForCell(cell)!
            let rep = self.representative[indexPath.row]
            
            let representativeDetailTableViewController = segue.destinationViewController as! RepresentativeDetailTableViewController
            representativeDetailTableViewController.representative = rep
            
        
        }
    }
    

}
