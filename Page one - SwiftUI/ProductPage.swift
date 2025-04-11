//
//  ProductPage.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 16/06/2023.
//

import SwiftUI

struct ProductPage: View {
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                               .green, .purple, .pink]
    
    var body: some View {
        
  
        
        NavigationStack{
            ScrollView(){
                
                TabView{
                        ForEach(0..<5) { i in
                            ZStack{
                                
                                Image("HeroImage")
                                        .resizable()
                                        .cornerRadius(20)
                                        .frame(width: UIScreen.main.bounds.width-10, height: 400)
                                        .scaledToFit()
                                        .padding(10)
                                VStack(alignment: .trailing){
                                
                                        
                                }
                                
                                
                            }.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .frame(width: UIScreen.main.bounds.width-100)
                            
                        }
                        .padding(.all, 10)
                    
                   
                
            
            }
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .tabViewStyle(PageTabViewStyle())
                .progressViewStyle(.linear)
                Spacer()
                
                HStack{
                    Stepper {
                                Text("\(value)")
                            .padding(10)
                            } onIncrement: {
                                incrementStep()
                            } onDecrement: {
                                decrementStep()
                            }
                            .padding(1)
                    Spacer()
                            
                    Button(action: {}, label: {
                        Text("Kjøp")
                    })
                    .frame(width: UIScreen.main.bounds.width - 150, height: 40, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.body)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding([.trailing], 5)
                    .shadow(radius: 1.0)
                }
            }
            
            .navigationTitle("Produktnavn")
            
        }
    }
    
    func incrementStep() {
            value += 1
            if value >= colors.count { value = 0 }
        }


        func decrementStep() {
            value -= 1
            if value < 0 { value = colors.count - 1 }
        }
}



struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
