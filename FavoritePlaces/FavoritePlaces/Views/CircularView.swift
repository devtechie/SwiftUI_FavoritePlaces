///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct CircularView: View {
    
    var image: Image
    
    var body: some View {
        image
        .resizable()
            .aspectRatio(contentMode: .fit)
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.green, lineWidth: 2))
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
    }
}
