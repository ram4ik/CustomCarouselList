//
//  CardView.swift
//  CustomCarouselList
//
//  Created by ramil on 03.09.2020.
//

import SwiftUI

struct CardView: View {
    
    var card: Book
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Read Now")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                })
                Spacer(minLength: 0)
            }
        }
    }
}

