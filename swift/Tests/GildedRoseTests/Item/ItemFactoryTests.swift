//
//  ItemFactoryTests.swift
//  
//
//  Created by Frank Thamel on 2022-08-21.
//

import XCTest
@testable import GildedRose

class ItemFactoryTests: XCTestCase {
    
    func testItemFactory_makeSubItem_agedBrie() {
        let itemName = "Aged Brie"
        let item = Item(name: itemName, sellIn: 3, quality: 6)
        
        let subType = ItemFactory.makeSubItem(for: item)
        
        XCTAssertTrue(subType is AgedBrie)
    }
    
    func testItemFactory_makeSubItem_backstagePasses() {
        let itemName = "Backstage passes to a TAFKAL80ETC concert"
        let item = Item(name: itemName, sellIn: 3, quality: 6)
        
        let subType = ItemFactory.makeSubItem(for: item)
        
        XCTAssertTrue(subType is BackstagePass)
    }
    
    func testItemFactory_makeSubItem_sulfuras() {
        let itemName = "Sulfuras, Hand of Ragnaros"
        let item = Item(name: itemName, sellIn: 3, quality: 6)
        
        let subType = ItemFactory.makeSubItem(for: item)
        
        XCTAssertTrue(subType is Sulfuras)
    }
    
    func testItemFactory_makeSubItem_conjured() {
        let itemName = "Conjured Mana Cake"
        let item = Item(name: itemName, sellIn: 3, quality: 6)
        
        let subType = ItemFactory.makeSubItem(for: item)
        
        XCTAssertTrue(subType is Conjured)
    }
    
    func testItemFactory_makeSubItem_normal() {
        let itemName = "foo"
        let item = Item(name: itemName, sellIn: 3, quality: 6)
        
        let subType = ItemFactory.makeSubItem(for: item)
        
        XCTAssertFalse(subType is AgedBrie)
        XCTAssertFalse(subType is BackstagePass)
        XCTAssertFalse(subType is Sulfuras)
        XCTAssertFalse(subType is Conjured)
    }
    
    
}
