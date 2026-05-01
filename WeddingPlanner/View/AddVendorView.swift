//
//  AddVendorView.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.
//

import SwiftUI

struct AddVendorView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: VendorViewModel
    
    @State private var name = ""
    @State private var category = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var price = ""
    @State private var status = "Contacted"
    @State private var notes = ""
    
    let statuses = ["Contacted", "Booked", "Not Chosen"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Vendor Info") {
                    TextField("Name", text: $name)
                    TextField("Category", text: $category)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                }
                
                Section("Booking") {
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                    
                    Picker("Status", selection: $status) {
                        ForEach(statuses, id: \.self) { status in
                            Text(status)
                        }
                    }
                }
                
                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(height: 120)
                }
            }
            .navigationTitle("Add Vendor")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newVendor = Vendor(
                            name: name,
                            category: category,
                            email: email,
                            phone: phone,
                            price: Double(price) ?? 0,
                            status: status,
                            notes: notes
                        )
                        
                        viewModel.addVendor(newVendor)
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
