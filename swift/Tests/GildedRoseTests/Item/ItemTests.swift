//
//  ItemTests.swift
//  
//
//  Created by Frank Thamel on 2022-08-21.
//

import XCTest

class ItemTests: XCTestCase {

    func testItem_forNegativeSellIn() {
        let name = "foo"
        let sellIn = -1
        let quality = 1
        
        let expectedQualityAfterDegrade = 0
        
        let itemQuality = TestHelper.updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }

}
