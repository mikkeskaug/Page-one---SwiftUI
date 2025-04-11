//
//  HeroTableModel.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 07/06/2022.
//

import Foundation
import SwiftUI
import Combine

struct HeroTableModel: Codable {
    var id = UUID()
    var title: String
    var description: String
    var imageURL: String
    var productURL: String
    var price: String
    var mode: String
}
struct HeroTableList: Codable {
    var results: [HeroTableModel]
}

struct AktueltModel: Identifiable {
    let id = UUID()
    let headline: String
    let text: String
    let imageURL: URL
    let price: String
   
}

class ImageViewModel: ObservableObject {
  
  
    
    func fetchImages() {
        // Make API requests here and populate imageModels
        // You can use URLSession or a networking library like Alamofire.
    }
    
    init(){
        
    }
}

class HeroHeadline: ObservableObject {
    
   @Published var value: String = "Test"
    @Published var desc: String = "Test"
    @Published var image: String = "Test"
    @Published var price: String = "Test"
    @Published var link: String = "Test"
    @Published var mode: String = "White"
    @Published var secondHeroTitle: String = "Test"
    @Published var secondHeroDesc: String = "Test"
    @Published var secondImage: String = "Test"
    @Published var aktueltDict2: [Int: [String]] = [:]
    @Published var product: [String] = [""]
    @Published var headlines: [String] = [""]
    @Published var images: [String] = [""]
    @Published var productLink: [String] = [""]
    @Published var prices: [String] = [""]
    

    
 
    init() {
        if (HeroArray.isEmpty){
            self.value = "Laster"
            self.desc = "Laster"
            self.image = "Laster"
            self.price = "Laster"
            self.link = "Laster"
            self.mode = "White"
            self.secondHeroTitle = "Laster"
            self.secondHeroDesc = "Laster"
            self.secondImage = "Laster"
            
            self.aktueltDict2 = aktueltDict
        }
        else {
            self.value = HeroArray[0]
            self.desc = HeroArray[1]
            self.image = HeroArray[2]
            self.price = HeroArray[4]
            self.link = HeroArray[3]
            self.mode = HeroArray[5]
            self.secondHeroTitle = SecondaryHeroArray[0]
            self.secondHeroDesc = SecondaryHeroArray[1]
            self.secondImage = SecondaryHeroArray[2]
            
            self.aktueltDict2 = aktueltDict
            
        }
        self.headlines = ["Laster", "Mister"]
        
        func updateHeadlines(newHeadlines: [String]) {
                headlines = newHeadlines // Update headlines with new values
            }
        
    }
    
    
    
    func getColor() -> Color { // This function just returns a color to where it is called
           switch mode {
           case "white": return Color.black
           case "black": return Color.white
           default: return Color.blue
           }
       }
    
    func fetch(){
        
        let url = NSURL(string: "https://pageone.no/app/storefrontapp.xml")
        //Creating data task
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if data == nil {
                print("dataTaskWithRequest error: \(String(describing: error?.localizedDescription))")
                return
            }
            else {
                
                XMLParser().startParsingWithContentsOfURL(rssURL: url! as URL)
               
            }
            DispatchQueue.main.async {
                self.value = HeroArray[0]
                self.desc = HeroArray[1]
                self.image = HeroArray [2]
                self.price = HeroArray[4]
                self.link = HeroArray[3]
                self.secondImage = SecondaryHeroArray[2]
                self.aktueltDict2 = aktueltDict
                
                self.headlines.removeAll()
       
        

                for (_, array) in self.aktueltDict2 {
                    if let firstItem = array.first {
                        self.headlines.append(firstItem)
                       
                    }
                }
                
                
               
                var fifthItemsArray: [String] = []

                for (_, array) in self.aktueltDict2 {
                    if array.count >= 5 {
                        fifthItemsArray.append(array[4])
                    }
                }
                
            }
            
            
          

            
        }
        task.resume()
        
        
    }
}




