///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct ViewSelectedPlace: View {
    
    var placeVM: PlaceViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                MapView(addressString: "\(placeVM.name), \(placeVM.country)")
                .frame(height: 400)
                    .edgesIgnoringSafeArea(.top)
                CircularView(image: Image(uiImage: UIImage(data: placeVM.image)!))
                .frame(width: 300, height: 300)
                    .offset(y: -350)
                    .padding(.bottom, -350)
                   // .background(Color.orange)
                HStack(alignment: .center) {
                    Text(placeVM.name)
                        .font(.title)
                    Spacer()
                    Divider()
                    Spacer()
                    Text(placeVM.country)
                }.padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                Text(placeVM.notes)
                    .lineLimit(100)
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                Spacer()
            }
        }.navigationBarTitle("\(placeVM.name)", displayMode: .inline)
    }
}

