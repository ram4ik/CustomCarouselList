//
//  Home.swift
//  CustomCarouselList
//
//  Created by ramil on 03.09.2020.
//

import SwiftUI


struct Home: View {
    
    var width = UIScreen.main.bounds.width - (40 + 60)
    var height = UIScreen.main.bounds.height / 2
    
    @State var books = [
        Book(id: 0, image: "p0", title: "", author: "", rating: 3, offset: 0),
        Book(id: 1, image: "p1", title: "", author: "", rating: 3, offset: 0),
        Book(id: 2, image: "p2", title: "", author: "", rating: 3, offset: 0),
        Book(id: 3, image: "p3", title: "", author: "", rating: 3, offset: 0),
        Book(id: 4, image: "p4", title: "", author: "", rating: 3, offset: 0),
        Book(id: 5, image: "p5", title: "", author: "", rating: 3, offset: 0),
    ]
    
    @State var swiped = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Custom Carousel")
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "circle.grid.2x2.fill")
                        .font(.system(size: 22))
                })
            }
            .foregroundColor(.white)
            .padding()
            
            Spacer(minLength: 0)
            
            ZStack {
                ForEach(books.reversed()) { book in
                    HStack {
                        ZStack {
                            Image(book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: getHeight(index: book.id))
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 0)
                            
                            CardView(card: book)
                                .frame(width: width, height: getHeight(index: book.id))
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .contentShape(Rectangle())
                    .padding(.horizontal, 20)
                    .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped) * 30 : 60)
                    .offset(x: book.offset)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                withAnimation {
                                    onScroll(value: value.translation.width, index: book.id)
                                }
                            })
                            .onEnded({ (value) in
                                withAnimation {
                                    onEnd(value: value.translation.width, index: book.id)
                                }
                            })
                    
                    )
                }
            }
            
            Spacer(minLength: 0)
        }
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)).ignoresSafeArea(.all, edges: .all))
    }
    
    func getHeight(index: Int) -> CGFloat {
        
        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 40 : 80)
    }
    
    func onScroll(value: CGFloat, index: Int) {
        
        if value < 0 {
            
            if index != books.last!.id {
                
                books[index].offset = value
            } else {
                
                if index > 0 {
                    
                    books[index - 1].offset = -(width + 60) + value
                }
            }
        }
    }
    
    func onEnd(value: CGFloat, index: Int) {
        
        if value < 0 {
            
            if -value > width / 2 && index != books.last!.id {
                
                books[index].offset = -(width + 60)
                swiped += 1
                
            } else {
                
                books[index].offset = 0
            }
        } else {
            
            if index > 0 {
                
                if value > width / 2 {
                    
                    books[index - 1].offset = 0
                    swiped -= 1
                } else {
                    
                    books[index - 1].offset = -(width + 60)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
