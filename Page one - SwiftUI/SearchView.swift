//
//  SearchView.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 05/12/2022.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                HStack(alignment: .top) {
                    
                    TextField("Search ...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
                            
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        
                    }
                    Spacer()
                }
                .navigationTitle("Søk")
                .frame(alignment: .top)
                Spacer()
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
        
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant("Test"))
    }
}
