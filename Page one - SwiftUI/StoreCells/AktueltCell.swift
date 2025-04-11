//
//  AktueltCell.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 04/06/2022.
//

import SwiftUI
    

struct AktueltCell: View {
    
   
    
    var body: some View {
     
        VStack(alignment: .leading){
            Text("Aktuelt")
                .font(.title)
                .fontWeight(.bold)
                .padding([.leading], 20)

        LazyHStack{
           
            PageView()
            
        }
        
    }

    }
}

struct AktueltCell_Previews: PreviewProvider {
    static var previews: some View {
        AktueltCell()
    }
}



struct PageView: View {
    
    @ObservedObject var heroheadline = HeroHeadline()
    @State private var showingHeadlines = false
    
    func updateHeadlines() {
            // Simulate updates
            let newHeadlines = ["New Headline 1", "New Headline 2", "New Headline 3"]
            /*HeroHeadline.updateHeadlines(newHeadlines: newHeadlines)*/
        }
    
    var body: some View {
        
        
        TabView{
            ForEach($heroheadline.headlines.indices, id: \.self) { i in
                    ZStack{
                        
                        Image("HeroImage")
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: UIScreen.main.bounds.width-50, height: 400)
                                .scaledToFit()
                                .padding(10)
                        if showingHeadlines == false {
                            VStack(alignment: .trailing){
                                Text(heroheadline.headlines[i])
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(20)
                                    
                            }
                        }
                        VStack(alignment: .trailing){
                            Text(heroheadline.headlines[i])
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(20)
                                
                        }
                        
                        
                    }.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .frame(width: UIScreen.main.bounds.width-100)
                    
                }
                .padding(.all, 10)
            
           
        
    
    }
        .frame(width: UIScreen.main.bounds.width, height: 400)
        .tabViewStyle(PageTabViewStyle())
        .progressViewStyle(.linear)
        
    }
}
