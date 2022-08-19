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
        if (quality > 0) {
            quality = quality - 1
        }
        
        sellIn = sellIn - 1
        
        if (sellIn < 0) {
            if (quality > 0) {
                quality = quality - 1
            }
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
        }
    }
}
