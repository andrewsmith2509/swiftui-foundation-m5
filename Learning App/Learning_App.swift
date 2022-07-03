//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Andrew Smith on 7/3/22.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
