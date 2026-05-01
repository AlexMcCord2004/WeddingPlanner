//
//  DashboardView.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: VendorViewModel
    
    var body: some View {
        HStack {
            VStack {
                Text("Total Cost")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text("$\(viewModel.totalCost, specifier: "%.2f")")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Text("Booked")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text("\(viewModel.bookedCount)")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.pink.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}
