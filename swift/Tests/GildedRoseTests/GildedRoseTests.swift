import Foundation
import XCTest

@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testGildedRose_updateQuality() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        XCTAssertEqual("foo", app.items[0].name);
    }
}
