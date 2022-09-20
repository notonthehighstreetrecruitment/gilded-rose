import Foundation

struct ItemWithType {
    enum ItemType: String {
        case agedBrie = "Aged Brie"
        case sulfuras = "Sulfuras"
        case backstagePasses = "Backstage passes"
        case conjured = "Conjured"
        case `default`
    }

    let item: Item
    let itemType: ItemType

    init(item: Item) {
        self.item = item

        if item.name.starts(with: ItemType.conjured.rawValue) {
            self.itemType = .conjured
        } else if item.name.starts(with: ItemType.sulfuras.rawValue) {
            self.itemType = .sulfuras
        } else if item.name.starts(with: ItemType.backstagePasses.rawValue) {
            self.itemType = .backstagePasses
        } else if item.name == ItemType.agedBrie.rawValue {
            self.itemType = .agedBrie
        } else {
            self.itemType = .default
        }
    }

    func updateQuality() {
        updateSellIn()

        var newQuality = item.quality
        switch self.itemType {
        case .agedBrie:
            newQuality = item.sellIn < 0 ? item.quality + 2 : item.quality + 1
        case .sulfuras:
            break
        case .backstagePasses:
            if item.sellIn < 0 {
                newQuality = 0
            } else if item.sellIn < 5 {
                newQuality = item.quality + 3
            } else if item.sellIn < 10 {
                newQuality = item.quality + 2
            } else {
                newQuality = item.quality + 1
            }
        case .conjured:
            newQuality = item.sellIn < 0 ? item.quality - 4 : item.quality - 2
        default:
            newQuality = item.sellIn < 0 ? item.quality - 2 : item.quality - 1
        }

        item.quality = max(min(maxQuality, newQuality), 0)
    }

    private func updateSellIn() {
        if itemType != .sulfuras {
            item.sellIn = item.sellIn - 1
        }
    }

    private var maxQuality: Int {
        switch itemType {
        case .sulfuras:
            return item.quality // or 80
        default:
            return 50
        }
    }
}
