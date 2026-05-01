//
//  VendorDetailView.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.
//

import SwiftUI

struct VendorDetailView: View {
    @State var vendor: Vendor
    @ObservedObject var viewModel: VendorViewModel
    
    @State private var showingEditView = false
    
    var body: some View {
        Form {
            Section("Vendor") {
                Text(vendor.name)
                Text(vendor.category)
            }
            
            Section("Contact") {
                Text(vendor.email)
                Text(vendor.phone)
            }
            
            Section("Booking") {
                Text("$\(vendor.price, specifier: "%.2f")")
                Text(vendor.status)
            }
            
            Section("Notes") {
                Text(vendor.notes)
            }
        }
        .navigationTitle(vendor.name)
        .toolbar {
            Button("Edit") {
                showingEditView = true
            }
        }
        .sheet(isPresented: $showingEditView) {
            EditVendorView(vendor: vendor, viewModel: viewModel)
        }
    }
}
