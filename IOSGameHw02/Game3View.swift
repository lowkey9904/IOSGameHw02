//
//  Game3View.swift
//  IOSGameHw02
//
//  Created by Joker on 2021/3/21.
//

import SwiftUI

struct Game3View: View {
    @State private var scrollViewY = 0
    var body: some View {
        VStack{
                ForEach(0..<playerNum){(outindex) in
                    let columns = [
                        GridItem(),
                        GridItem(),
                        GridItem(),
                        GridItem(),
                        GridItem(),
                    ]
                    LazyVGrid(columns: columns) {
                        ForEach(whichPlayer[outindex].indices) { (index) in
                            VStack {
                                Image(whichPlayer[outindex][index].imagestr)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                            }
                        }
                    }.padding()
                    Spacer()
                }
            }.offset(y:CGFloat(self.scrollViewY))
            .padding()
            .background(Image("mainbg").resizable()
            .frame(width: 800, height: 1200, alignment: .center)
            .blur(radius: 10))
    }
}

struct Game3View_Previews: PreviewProvider {
    static var previews: some View {
        Game3View()
    }
}
