//
//  Trip.swift
//  UI-218
//
//  Created by にゃんにゃん丸 on 2021/06/02.
//

import SwiftUI

struct Trip: Identifiable,Hashable {
    var id = UUID().uuidString
    var title : String
    var image : String
    
    
}

var trips = [
    Trip(title: "Netherland", image: "p1"),
    Trip(title: "France", image: "p2"),
    Trip(title: "Japan", image: "p3"),
    Trip(title: "New York", image: "p4"),
    Trip(title: "Switzerland", image: "p5"),
    
    
]
