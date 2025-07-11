//
//  Birthday_appApp.swift
//  Birthday-app
//
//  Created by Manisha Raman on 11/7/2025.
//

import SwiftUI
import SwiftData

@main
struct Birthday_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:Friend.self)
        }
    }
}
