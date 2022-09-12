//
//  NewModel.swift
//  NewCollectionView
//
//  Created by santelizvargas on 9/8/22.
//

import Foundation

struct Device: Hashable {
    let id: UUID = UUID()
    let title: String
    let imageName: String
}

var device = [
Device(title: "Laptop", imageName: "laptopcomputer"),
Device(title: "Mac Mini", imageName: "macmini"),
Device(title: "Mac Pro", imageName: "macpro.gen3"),
Device(title: "Pantallas", imageName: "display.2"),
Device(title: "TV", imageName: "appletv"),
]

var device2 = [
Device(title: "Laptop", imageName: "laptopcomputer"),
Device(title: "Mac Mini", imageName: "macmini"),
Device(title: "Mac Pro", imageName: "macpro.gen3"),
Device(title: "Pantallas", imageName: "display.2"),
Device(title: "TV", imageName: "appletv"),
]
