//
//  ContentView.swift
//  Gustro
//
//  Created by mh on 2024/03/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Restaurant.name) var restrants: [Restaurant]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restrants) { restrant in
                    NavigationLink(value: restrant) {
                        VStack(alignment: .leading) {
                            Text(restrant.name)
                            Text("\(restrant.priceRating)")
                            Text("\(restrant.qualityRating)")
                            Text("\(restrant.speedRating)")
                            Text("**平均: \(restrant.average)**")
                        }
                    }
       
                }.onDelete(perform: deleteRestrant)
            }
            .navigationTitle("レストラン")
            .toolbar {
                ToolbarItem {
                    Button("add", systemImage: "plus", action: addItems)
                }
            }
            .navigationDestination(for: Restaurant.self) { restaurant in
                EditRestaurantView(restaurant: restaurant)
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
    
    func deleteRestrant(indexSet: IndexSet) {
        for index in indexSet {
            let object = restrants[index]
            modelContext.delete(object)
        }
    }
}

#Preview {
    ContentView()
}
