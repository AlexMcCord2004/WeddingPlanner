import Foundation
import Combine
import FirebaseFirestore

class VendorViewModel: ObservableObject {
    
    @Published var vendors: [Vendor] = []
    
    private let db = Firestore.firestore()
    
    init() {
        fetchVendors()
    }
    
    func fetchVendors() {
        db.collection("vendors").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching vendors: \(error.localizedDescription)")
                return
            }
            
            self.vendors = snapshot?.documents.compactMap { document in
                let data = document.data()
                
                return Vendor(
                    id: document.documentID,
                    name: data["name"] as? String ?? "",
                    category: data["category"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    phone: data["phone"] as? String ?? "",
                    price: data["price"] as? Double ?? 0,
                    status: data["status"] as? String ?? "",
                    notes: data["notes"] as? String ?? ""
                )
            } ?? []
        }
    }
    
    func addVendor(_ vendor: Vendor) {
        db.collection("vendors").addDocument(data: [
            "name": vendor.name,
            "category": vendor.category,
            "email": vendor.email,
            "phone": vendor.phone,
            "price": vendor.price,
            "status": vendor.status,
            "notes": vendor.notes
        ])
    }
    
    func updateVendor(_ vendor: Vendor) {
        guard let id = vendor.id else { return }
        
        db.collection("vendors").document(id).setData([
            "name": vendor.name,
            "category": vendor.category,
            "email": vendor.email,
            "phone": vendor.phone,
            "price": vendor.price,
            "status": vendor.status,
            "notes": vendor.notes
        ])
    }
    
    func deleteVendor(_ vendor: Vendor) {
        guard let id = vendor.id else { return }
        db.collection("vendors").document(id).delete()
    }
    
    var totalCost: Double {
        vendors.reduce(0) { $0 + $1.price }
    }
    
    var bookedCount: Int {
        vendors.filter { $0.status == "Booked" }.count
    }
}
