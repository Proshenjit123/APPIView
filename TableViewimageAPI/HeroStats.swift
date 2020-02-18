//
//  HeroStats.swift
//  TableViewimageAPI
//
//  Created by Proshenjit kumar on 17/2/20.
//  Copyright © 2020 Proshenjit kumar. All rights reserved.
//

import Foundation

struct HeroStats:Decodable{
    
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    

    
}
