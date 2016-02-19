//
//  RepresentativeDetailTableViewController.swift
//  Representatives
//
//  Created by Cameron Moss on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeDetailTableViewController: UITableViewController {
    
    var representative: Representative?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let rep = representative else {
            return tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
        }

        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            cell.textLabel?.text = rep.name
            if let state = rep.state {
                cell.imageView?.image = UIImage(named: state)
            }
            var stateDistrict = ""
            if let state = rep.state {
                stateDistrict = state + " - "
            }
            if let district = rep.district {
                stateDistrict = stateDistrict + district
            }
            cell.detailTextLabel?.text = stateDistrict
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.detailTextLabel?.text = "Party"
            cell.textLabel?.text = rep.party
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.detailTextLabel?.text = "Website"
            cell.textLabel?.text = rep.link
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.detailTextLabel?.text = "Phone"
            cell.textLabel?.text = rep.phone
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.detailTextLabel?.text = "Office"
            cell.textLabel?.text = rep.office
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            return cell
        
        
        }
    }

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
