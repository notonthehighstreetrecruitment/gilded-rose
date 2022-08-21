//
//  ItemFactory.swift
//  
//
//  Created by Frank Thamel on 2022-08-21.
//

import Foundation

struct ItemFactory {
    
    /**
     Create sub-classes based on the name property
     */
    static func makeSubItem(for item: Item) -> Item {
        
        guard let type = ItemType(rawValue: item.name) else {
            return item
        }
        
        switch type {
        case .agedBrie:
            return AgedBrie(name: item.name, sellIn: item.sellIn, quality: item.quality)
        case .backstagePasses:
            return BackstagePass(name: item.name, sellIn: item.sellIn, quality: item.quality)
        case .sulfuras:
            return Sulfuras(name: item.name, sellIn: item.sellIn, quality: item.quality)
        case.conjured:
            return Conjured(name: item.name, sellIn: item.sellIn, quality: item.quality)
        }
    }
}
