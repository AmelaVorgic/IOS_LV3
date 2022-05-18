//
//  University.swift
//  lv3_Vorgic
//
//  Created by student on 14.05.2022..
//

import UIKit
import SwiftyJSON

class University {
    let name: String
    let country: String
    let url: URL?
    
    init(with json: JSON){
        name=json["name"].stringValue
        country=json["country"].stringValue
        url=json["web_pages"][0].url
    }
}
