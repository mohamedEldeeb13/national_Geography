//
//  covers.swift
//  national_Geography
//
//  Created by Mohamed Abd Elhakam on 30/12/2023.
//

import Foundation
struct coverModel : Identifiable {
    let id : Int
    let coverName : String
    var Thumbnails : String {
        return "thumb-" + coverName
    }
}
