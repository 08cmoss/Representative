//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Cameron Moss on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class RepresentativeController {
    
    static let kBaseURLString = "http://whoismyrepresentative.com/getall_reps_bystate.php?state="
    
    static func getRepFromSearchTerm(searchTerm: String, completion: (reps: [Representative]) -> Void) {
      
       let repSearchURLString = RepresentativeController.kBaseURLString + searchTerm + "&output=json"
        
        if let url = NSURL(string: repSearchURLString) {
            NetworkController.dataAtURL(url, completion: { (data) -> Void in
                if let data = data,
                let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                let jsonDictionary = jsonAnyObject as? [String: AnyObject],
                let resultsArray = jsonDictionary["results"] as? [[String: String]] {
                    
                    var reps = [Representative]()
                    for resultDictionary in resultsArray {
                        if let rep = Representative(jsonDictionary: resultDictionary) {
                            reps.append(rep)
                        }
                    }
                completion(reps: reps)
                } else {
                    completion(reps: [])
                }
            })
        } else {
            completion(reps: [])
        }
    }
}