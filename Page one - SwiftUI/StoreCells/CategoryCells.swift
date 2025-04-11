//
//  CategoryCells.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 05/06/2022.
//

import SwiftUI

struct CategoryCells: View {
    var category: Category
    var body: some View {
        
        ZStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    Text(category.name)
                        .fontWeight(.bold)
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                
                Image(category.image)
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                .frame(width: 125.0, height: 125.0)
                .scaledToFill()
                
                
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .frame(width: UIScreen.main.bounds.width/2-10, height: 175)
            .background(.white)
                .cornerRadius(20)
                
        
               
        
    }
}

struct CategoryCells_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCells(category: categoryList[0])
    }
}


