//
//  ItemType.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

/// This enum contains item names that is used in the updateQuality method
enum ItemType: String {
    case agedBrie = "Aged Brie"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    
    var name: String {
        self.rawValue
    }
}
