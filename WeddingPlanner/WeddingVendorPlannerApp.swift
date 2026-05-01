//
//  WeddingVendorPlannerApp.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.
//

import SwiftUI
import FirebaseCore

@main
struct WeddingVendorPlannerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            VendorListView()
        }
    }
}
