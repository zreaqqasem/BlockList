//
//  CurrentUserBlockList.swift
//  qasem_xib-example
//
//  Created by Qasem Zreaq on 9/7/20.
//  Copyright © 2020 Qasem Zreaq. All rights reserved.
//

import Foundation


struct CurrentUserBlockList : Codable  {
    
    let total : Int
    let users : [users]
    
}

struct users : Codable {
    
    var followStatus : Int
    let id : Int
    let name : String
    let profilePicture : String
    
}
