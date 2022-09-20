import Foundation
import XCTest

@testable import GildedRose

class GildedRoseTests: XCTestCase {
    func testItem_beforeSellOutDate() {
        let items = [Item(name: "Any item", sellIn: 1, quality: 4)]
        let app = GildedRose(items: items)

        app.updateQuality()

        XCTAssertEqual(0, app.items[0].sellIn)
        XCTAssertEqual(3, app.items[0].quality)
    }

    func testItem_afterSellOutDate() {
        let items = [Item(name: "Any item", sellIn: 0, quality: 4)]
        let app = GildedRose(items: items)

        app.updateQuality()

        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(2, app.items[0].quality)
    }

    func testItem_minimumQuality() {
        let items = [Item(name: "Any item", sellIn: -1, quality: 0)]
        let app = GildedRose(items: items)

        app.updateQuality()

        XCTAssertEqual(-2, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }

    func test_maximumQuality() {
        let items = [Item(name: "Aged Brie", sellIn: 1, quality: 50)]
        let app = GildedRose(items: items)

        app.updateQuality()

        XCTAssertEqual(0, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)

        app.updateQuality()

        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }

    func test_maximumQuality_afterSellOutDateIncreased() {
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 49)]
        let app = GildedRose(items: items)

        app.updateQuality()

        XCTAssertEqual(-2, app.items[0].sellIn)
        XCTAssertEqual(50, app.items[0].quality)
    }

    func testAgedBrie_beforeSellOutDate() {
        let items = [Item(name: "Aged Brie", sellIn: 1, quality: 4)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(0, app.items[0].sellIn)
        XCTAssertEqual(5, app.items[0].quality)
    }

    func testAgedBrie_afterSellOutDate() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 4)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(6, app.items[0].quality)
    }

    func testSulfuras_beforeSellOut() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 1, quality: 80)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(1, app.items[0].sellIn)
        XCTAssertEqual(80, app.items[0].quality)
    }

    func testSulfuras_afterSellOut() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(80, app.items[0].quality)
    }

    func testBackstagePasses_moreThan10Days() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(10, app.items[0].sellIn)
        XCTAssertEqual(21, app.items[0].quality)
    }

    func testBackstagePasses_lessThan10Days() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(5, app.items[0].sellIn)
        XCTAssertEqual(22, app.items[0].quality)
    }

    func testBackstagePasses_lessThan5Days() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(4, app.items[0].sellIn)
        XCTAssertEqual(23, app.items[0].quality)
    }

    func testBackstagePasses_afterSellOut() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 1, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(0, app.items[0].sellIn)
        XCTAssertEqual(23, app.items[0].quality)

        app.updateQuality()
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(0, app.items[0].quality)
    }

    func testConjured_beforeSellOutDate() {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 1, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(0, app.items[0].sellIn)
        XCTAssertEqual(18, app.items[0].quality)
    }

    func testConjured_afterSellOutDate() {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 0, quality: 20)]
        let app = GildedRose(items: items)

        app.updateQuality()
        XCTAssertEqual(-1, app.items[0].sellIn)
        XCTAssertEqual(16, app.items[0].quality)
    }
}
