//
//  Vendor.swift
//  WeddingPlanner
//
//  Created by Alex McCord on 5/1/26.

import Foundation

struct Vendor: Identifiable, Codable {
    var id: String?
    var name: String
    var category: String
    var email: String
    var phone: String
    var price: Double
    var status: String
    var notes: String
}
