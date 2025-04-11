//
//  Fetch Data.swift
//  Page one - SwiftUI
//
//  Created by Jon Mikael Skaug on 05/12/2022.
//

import SwiftUI

struct FetchData: View {
    
    @State private var data: [Data] = []
    
    var body: some View {
        VStack {
            List(data, id: \.id) { item in
                Text(item.name)
            }
        }
        .onAppear {
            self.fetchData()
        }
    }
    
    private func fetchData() {
        let url = URL(string: "https://example.com/api/data")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let items = try? decoder.decode([Data].self, from: data) {
                    DispatchQueue.main.async {
                        self.data = items
                    }
                }
            }
        }.resume()
    }
}


struct Fetch_Data_Previews: PreviewProvider {
    static var previews: some View {
        Fetch_Data()
    }
}
