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
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(restrants) { restrant in
                    NavigationLink(value: restrant) {
                        VStack(alignment: .leading) {
                            Text(restrant.name)
                            Spacer(minLength: 10)
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    ForEach(0..<restrant.priceRating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                    }
                                }
                                HStack {
                                    ForEach(0..<restrant.qualityRating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                    }
                                }
                                HStack {
                                    ForEach(0..<restrant.speedRating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                    }
                                }
                                
                                
                            }
                            Spacer(minLength: 10)
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
                ToolbarItem {
                    Button(action: {
                        let newRestaurant = Restaurant(name: "new resaurant", priceRating: 0, qualityRating: 0, speedRating: 0)
                        modelContext.insert(newRestaurant)
                        navigationPath.append(newRestaurant)
                    }) {
                        Label("追加", systemImage: "minus")
                    }
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
