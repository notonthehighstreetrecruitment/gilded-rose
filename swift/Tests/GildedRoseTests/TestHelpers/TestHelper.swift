//
//  TestHelper.swift
//  
//
//  Created by Frank Thamel on 2022-08-21.
//

import Foundation
@testable import GildedRose

struct TestHelper {
    
    static func updateQualityHelper(name: String, sellIn: Int, quality: Int) -> String {
        let items = [Item(name: name, sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        return app.items[0].description
    }
    
    static func updateItemQualityHelper(name: String, sellIn: Int, quality: Int) -> Int {
        let items = [Item(name: name, sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        return app.items[0].quality
    }
}
