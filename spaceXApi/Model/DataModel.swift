//
//  DataModel.swift
//  spaceXApi
//
//  Created by AbdulKadir Akkaş on 29.09.2021.
//

import Foundation
struct DataModel : Codable {
    
    var links : Links
    var details : String
    var name : String
}


struct Links: Codable {
    var patch : Patch
}


struct Patch : Codable{
    var small : String
    var large : String
}
