//
//  File.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

extension Item {
    
    /**
     Default `updateQuality` implementation for item types that are not listed and sub classed
    */
    @objc func updateQuality() {
        
        // Lowers sellIn value by 1 each day
        sellIn -= 1
        
        guard quality > 0 else { return }
        
        // Degrades quality by 1
        quality = quality - 1
        
        // Degrades quality by 1 only if sellIn day passed
        if sellIn < 0 {
            quality -= 1
        }
        
        // The Quality of an item is never negative
        if quality < 0 {
            quality = 0
        }
        
    }
    
    /**
     Create sub-classes based on the name property
     */
    func toSubType() -> Item {
        guard let type = ItemType(rawValue: name) else {
            return self
        }
        
        switch type {
        case .agedBrie:
            return AgedBrie(name: self.name, sellIn: self.sellIn, quality: self.quality)
        case .backstagePasses:
            return BackstagePass(name: self.name, sellIn: self.sellIn, quality: self.quality)
        case .sulfuras:
            return Sulfuras(name: self.name, sellIn: self.sellIn, quality: self.quality)
        case.conjured:
            return Conjured(name: self.name, sellIn: self.sellIn, quality: self.quality)
        }
    }
}
