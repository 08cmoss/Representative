//
//  Representative.swift
//  Representatives
//
//  Created by Cameron Moss on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Representative {
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    var name : String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    init?(jsonDictionary: [String: AnyObject]) {
        guard let name = jsonDictionary[kName] as? String else { return nil}
        self.name = name
        self.party = jsonDictionary[kParty] as? String ?? ""
        self.state = jsonDictionary[kState] as? String ?? ""
        self.district = jsonDictionary[kDistrict] as? String ?? ""
        self.phone = jsonDictionary[kPhone] as? String ?? ""
        self.office = jsonDictionary[kOffice] as? String ?? ""
        self.link = jsonDictionary[kLink] as? String ?? ""
    }
}
