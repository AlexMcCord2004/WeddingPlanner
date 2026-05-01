import SwiftUI

struct VendorListView: View {
    @StateObject private var viewModel = VendorViewModel()
    @State private var showingAddVendor = false
    
    var body: some View {
        NavigationStack {
            VStack {
                DashboardView(viewModel: viewModel)
                
                List {
                    ForEach(viewModel.vendors) { vendor in
                        NavigationLink(destination: VendorDetailView(vendor: vendor, viewModel: viewModel)) {
                            VStack(alignment: .leading) {
                                Text(vendor.name)
                                    .font(.headline)
                                
                                Text("\(vendor.category) • \(vendor.status)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewModel.deleteVendor(viewModel.vendors[index])
                        }
                    }
                }
            }
            .navigationTitle("Wedding Vendors")
            .toolbar {
                Button {
                    showingAddVendor = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddVendor) {
                AddVendorView(viewModel: viewModel)
            }
        }
    }
}
