//
//  Book.swift
//  CustomCarouselList
//
//  Created by ramil on 03.09.2020.
//

import SwiftUI

struct Book: Identifiable {
    
    var id: Int
    var image: String
    var title: String
    var author: String
    var rating: Int
    var offset: CGFloat
}
