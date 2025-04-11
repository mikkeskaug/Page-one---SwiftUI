//
//  SaveContactsView.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 29/05/2022.
//

import SwiftUI

struct SaveContactsView: View {
    var body: some View {
        if #available(macCatalyst 16.0, *) {
            if #available(iOS 16.0, *) {
                NavigationStack{
                    VStack(alignment: .center, spacing: 20){
                        Text("Redd kontakter ved å trykke på en av knappene under")
                            .multilineTextAlignment(.center)
                            .padding(20)
                        
                        
                        Button("Lagre kontakter som CSV") {
                            CSV()
                        }
                        .   padding()
                        .foregroundColor(Color("SecondaryLabel"))
                        .font(.body)
                        .background(Color("PrimaryButton"))
                        .cornerRadius(20)
                        .shadow(radius: 1.0)
                        
                        Button("Lagre kontakter som kontaktfil") {
                            contact()
                        }
                        .padding()
                        .foregroundColor(Color("SecondaryLabel"))
                        .font(.body)
                        .background(Color("PrimaryButton"))
                        .cornerRadius(20)
                        .shadow(radius: 1.0)
                        
                        Spacer()
                        
                    }.navigationTitle("Redd kontakter")
                    
                    
                }
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
            NavigationView{
                VStack(alignment: .center, spacing: 20){
                    Text("Redd kontakter ved å trykke på en av knappene under")
                        .multilineTextAlignment(.center)
                        .padding(20)
                    
                    
                    Button("Lagre kontakter som CSV") {
                        CSV()
                    }
                    .   padding()
                    .foregroundColor(Color("SecondaryLabel"))
                    .font(.body)
                    .background(Color("PrimaryButton"))
                    .cornerRadius(20)
                    .shadow(radius: 1.0)
                    
                    Button("Lagre kontakter som kontaktfil") {
                        contact()
                    }
                    .padding()
                    .foregroundColor(Color("SecondaryLabel"))
                    .font(.body)
                    .background(Color("PrimaryButton"))
                    .cornerRadius(20)
                    .shadow(radius: 1.0)
                    
                    Spacer()
                    
                }.navigationTitle("Redd kontakter")
                    .navigationViewStyle(.stack)
                
            }
        }
        
}
}

func CSV () {
    
}

func contact () {
    
}

struct SaveContactsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveContactsView()
        
        
    }
}
