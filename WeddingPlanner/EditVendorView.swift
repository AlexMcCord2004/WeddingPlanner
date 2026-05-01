//
//  EditVendorView.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.
//

import SwiftUI

struct EditVendorView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var vendor: Vendor
    @ObservedObject var viewModel: VendorViewModel
    
    @State private var priceText = ""
    
    let statuses = ["Contacted", "Booked", "Not Chosen"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Vendor Info") {
                    TextField("Name", text: $vendor.name)
                    TextField("Category", text: $vendor.category)
                    TextField("Email", text: $vendor.email)
                    TextField("Phone", text: $vendor.phone)
                }
                
                Section("Booking") {
                    TextField("Price", text: $priceText)
                        .keyboardType(.decimalPad)
                    
                    Picker("Status", selection: $vendor.status) {
                        ForEach(statuses, id: \.self) { status in
                            Text(status)
                        }
                    }
                }
                
                Section("Notes") {
                    TextEditor(text: $vendor.notes)
                        .frame(height: 120)
                }
            }
            .navigationTitle("Edit Vendor")
            .onAppear {
                priceText = String(vendor.price)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        vendor.price = Double(priceText) ?? 0
                        viewModel.updateVendor(vendor)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
