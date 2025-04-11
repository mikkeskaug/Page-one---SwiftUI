//
//  ContentView.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 29/05/2022.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        TabView{
        StoreView()
                .tabItem {
                    Label("Butikk", systemImage: "cart")
                }
            
            MapView(location: MapLocation.init(latitude: 37.7749, longitude: -122.4194, title: "San Francisco"))
                .tabItem {
                    Label("Kart", systemImage: "mappin.circle")
                }
            
        ContactView()
                .tabItem {
                    Label("Kontakt oss", systemImage: "mail.stack")
                }
            
        ServiceView()
                .tabItem {
                    Label("Service", systemImage: "gear.circle")
                }
            
        /*SaveContactsView()
                .tabItem {
                    Label("Redd Kontakter", systemImage: "person.circle")
                }*/
            
           
        }
        . accentColor(Color("PrimaryLabel"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
