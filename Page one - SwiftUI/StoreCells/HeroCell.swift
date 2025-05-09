//
//  HeroCell.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 04/06/2022.
//

import SwiftUI

struct HeroCell: View {
    

    @ObservedObject var headline = HeroHeadline()
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            VStack{
                AsyncImage(url: URL(string: headline.image), scale: 2) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 500)
                .cornerRadius(20)
                .padding(10)
                
                
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 500)
            .shadow(color: headline.getColor(), radius: 3)
            
            
           
            
            
            VStack(alignment: .leading, spacing: 0){
               
                Text(headline.value)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(20)
                    .font(.headline)
                    .foregroundStyle(headline.getColor())
                    .padding([.top], 0)
                
                Text(headline.desc)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding([.horizontal], 20)
                    .padding([.top], 0)
                    .font(.footnote)
                    .foregroundStyle(headline.getColor())
            
                Spacer()
                HStack(){
                    
                    Text(headline.price)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding()
                        .foregroundStyle(Color.white)
                    
                    Spacer()
            
                    NavigationLink {
                        // destination view to navigation to
                        ProductPage()
                    } label:  {
                        Text("Kjøp")
                    }
                    .frame(width: 100, height: 40, alignment: .center)
                    .foregroundColor(Color("PrimaryLabel"))
                    .font(.body)
                    .background(Color("SecondaryButton"))
                    .cornerRadius(20)
                    .padding([.trailing], 5)
                    .shadow(radius: 1.0)
                        
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 70)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding([.leading, .trailing], 10)
                
                
               
            }
            .frame(width: UIScreen.main.bounds.width, height: 500)
            
            
            
        }
       
        
    }
   
}

struct HeroCell_Previews: PreviewProvider {
    static var previews: some View {
        HeroCell()
 
    }
}
