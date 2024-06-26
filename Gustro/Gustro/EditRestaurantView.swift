//
//  EditRestaurantView.swift
//  Gustro
//
//  Created by mh on 2024/03/26.
//

import SwiftData
import SwiftUI


struct EditRestaurantView: View {
    
    @Bindable var restaurant: Restaurant
    
    var body: some View {
        Form {
            TextField("Name of Restaurant", text: $restaurant.name)
            Section("Rating") {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        ForEach(0..<restaurant.priceRating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                        }
                    }
                    HStack {
                        ForEach(0..<restaurant.qualityRating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                        }
                    }
                    HStack {
                        ForEach(0..<restaurant.speedRating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                        }
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Restaurant.self, configurations: config)
    let example = Restaurant(name: "mock name", priceRating: 2, qualityRating: 5, speedRating: 4)
    return EditRestaurantView(restaurant: example).modelContainer(container)
}
