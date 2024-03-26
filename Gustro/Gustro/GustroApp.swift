//
//  GustroApp.swift
//  Gustro
//
//  Created by mh on 2024/03/26.
//

import SwiftUI
import SwiftData

@main
struct GustroApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Restaurant.self)
    }
}
