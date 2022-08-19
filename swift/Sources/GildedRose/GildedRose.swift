
public class GildedRose {
    var items: [Item]
    
    public required init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for i in 0..<items.count {
            let item = items[i]
            updateQuality(forItem: item)
        }
    }
    
    private func updateQuality(forItem item: Item) {
        switch item.name {
        case ItemType.agedBrie.name:
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
            
            item.sellIn = item.sellIn - 1
            
            if (item.sellIn < 0) {
                if (item.quality < 50) {
                    item.quality = item.quality + 1
                }
            }
        case ItemType.backstagePasses.name:
            if (item.quality < 50) {
                item.quality = item.quality + 1
                
                if (item.sellIn < 11) {
                    if (item.quality < 50) {
                        item.quality = item.quality + 1
                    }
                }
                
                if (item.sellIn < 6) {
                    if (item.quality < 50) {
                        item.quality = item.quality + 1
                    }
                }
            }
            
            item.sellIn = item.sellIn - 1
            
            if (item.sellIn < 0) {
                item.quality = 0
            }
        case ItemType.sulfuras.name:
            break
        default:
            if (item.quality > 0) {
                item.quality = item.quality - 1
            }
            
            item.sellIn = item.sellIn - 1
            
            if (item.sellIn < 0) {
                if (item.quality > 0) {
                    item.quality = item.quality - 1
                }
            }
        }
    }
}
