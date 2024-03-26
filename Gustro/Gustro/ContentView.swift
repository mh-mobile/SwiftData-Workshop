//
//  ContentView.swift
//  Gustro
//
//  Created by mh on 2024/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Text("hoge")
                }
            }
            .navigationTitle("レストラン")
            .toolbar {
                ToolbarItem {
                    Button("add", systemImage: "plus", action: addItems)
                }
            }
        }
    }
    
    func addItems() {
        let names = [
            "Wok this Way",
            "Thyme Square",
            "Pasta la Vista",
            "Life of Pie",
            "Lord of the Wings"
        ]
        
        for name in names {
            let item = Restaurant(name: name, priceRating: 2, qualityRating: 3, speedRating: 4)
            modelContext.insert(item)
        }
    }
}

#Preview {
    ContentView()
}
