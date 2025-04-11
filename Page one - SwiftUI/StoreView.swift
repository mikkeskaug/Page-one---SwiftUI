//
//  StoreView.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 29/05/2022.
//

import SwiftUI
import Foundation

var count = 0
var HeroArray = [String]()
var SecondaryHeroArray = [String]()
var aktueltDict: [Int: [String]] = [:]
var tempArray = [String]()


struct StoreView: View {
    
    var columns = [GridItem(.adaptive(minimum: 140), spacing: 20)]
    @StateObject var headline = HeroHeadline()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                ScrollView(){
                    
                    HeroCell()
                        .padding(2)
                    SecondaryHeroCell()
                        .padding(2)
                    
                    AktueltCell()
                        .padding(2)
                    
                    VStack(alignment: .leading){
                        Text("Kjøp etter kategori")
                            .padding()
                            .font(.title)
                    }
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(categoryList, id: \.id) { category in
                            CategoryCells(category: category)
                        }
                    }.padding()
                        .background(Color(UIColor.secondarySystemBackground))
                    
                    
                    Spacer()
                }
                
                .navigationTitle("Butikk")
                .toolbar{
                    NavigationLink(destination: SearchView(text: .constant(""))) {
                        Text("Søk")
                    }
                }
            }
            .onAppear(perform: headline.fetch)
        } else {
            // Fallback on earlier versions
            NavigationView{
                ScrollView(){
                    
                    HeroCell()
                        .padding(2)
                    SecondaryHeroCell()
                        .padding(2)
                    
                    AktueltCell()
                        .padding(2)
                    
                   
                    LazyVGrid(columns: columns, spacing: 20) {
                        VStack(alignment: .leading){
                            Text("Kjøp etter kategori")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.leading], 20)
                        }
                        
                        ForEach(categoryList, id: \.id) { category in
                            CategoryCells(category: category)
                        }
                    }.padding()
                        .background(Color("GreyBackground"))
                    
                    
                    Spacer()
                }
                
                .navigationTitle("Butikk")
            }
            .onAppear(perform: headline.fetch)
        }
        }
    
    
}

func loadContent(){
    
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
        
        
        
        
        
        
    }
    task.resume()
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}

