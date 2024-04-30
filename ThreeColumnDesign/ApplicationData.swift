//
//  ApplicationData.swift
//  SplitViewController
//
//  Created by Palliboina on 28/04/24.
//

import Foundation
import UIKit

enum Sections{
    case main
}

class Category : Identifiable{
    var id : UUID = UUID()
    var name:String
    var items:[ItemData]
    
    init(name: String, items: [ItemData]) {
        self.name = name
        self.items = items
    }
}

class ItemData:Identifiable{
    var id:UUID = UUID()
    var name:String
    var image:String
    var calories:Int
    var selected:Bool
    
    init(name: String, image: String, calories: Int, selected: Bool) {
        self.name = name
        self.image = image
        self.calories = calories
        self.selected = selected
    }
}

struct ApplicationData{
    var dataSourceCategories:UICollectionViewDiffableDataSource<Sections,Category.ID>!
    var dataSource:UICollectionViewDiffableDataSource<Sections,ItemData.ID>!
    var categories:[Category] = [] {
        didSet{
            categories.sort(by: {$0.name<$1.name})
        }
    }
    
    var selectedCategory:Category!
    
    init(){
        categories.append(Category(name:"Food",items:[ItemData(name: "Bagels", image: "bagels", calories: 250, selected: false),ItemData(name: "Brownies", image: "brownies", calories: 466, selected: false)]))
        
        categories.append(Category(name: "Kitchen Cooking", items: [ItemData(name: "Butter", image: "butter", calories: 717, selected: false),ItemData(name: "Cheese", image: "cheese", calories: 402, selected: false)]))
        
        categories.append(Category(name: "Vegetables", items: [ItemData(name: "Tomatoes", image: "tomatoes", calories: 502, selected: false),ItemData(name: "Potatoes", image: "potatoes", calories: 250, selected: false),ItemData(name: "Brinjal", image: "brinjal", calories: 250, selected: false)]))
        
        categories.append(Category(name:"Beverages",items:[ItemData(name: "Coffee", image: "coffee", calories: 0, selected: false)]))
        
        categories.append(Category(name: "Fruits", items: [ItemData(name: "Grapes", image: "grapes", calories: 250, selected: false)]))
        
        selectedCategory = categories.first
    }
}

var appData = ApplicationData()
