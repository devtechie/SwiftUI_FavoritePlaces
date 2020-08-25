///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct PlaceCell: View {
    
    var placeVM: PlaceViewModel
    
    var body: some View {
        NavigationLink(destination: ViewSelectedPlace(placeVM: placeVM)) {
            HStack {
                Image(uiImage: UIImage(data: placeVM.image)!)
                .resizable()
                .frame(width: 66, height: 100)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(placeVM.name)
                        .font(.headline)
                    Text(placeVM.country)
                        .font(.subheadline)
                    Text(placeVM.notes)
                        .font(.caption)
                }
            }
        }        
    }
}
