//
//  Category.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 05/06/2022.
//

import Foundation

struct Category: Identifiable {
    var id = UUID()
    var name = String()
    var image = String()
}

var categoryList = [Category(name: "Mac", image: "MacCategory"),
                    Category(name: "iPhone", image: "iPhoneCategory"),
                    Category(name: "iPad", image: "iPadCategory"),
                    Category(name: "Apple Watch", image: "WatchCategory"),
                    Category(name: "Airpods", image: "AirpodsCategory"),
                    Category(name: "AirTag", image: "AirTagCategory"),
                    Category(name: "TV & Hjem", image: "AppleTVCategory"),
                    Category(name: "Tilbehør", image: "TilbehorCategory")]

