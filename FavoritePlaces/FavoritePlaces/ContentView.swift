///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/14/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var placeListVM = PlaceListViewModel()
    
    var body: some View {
        NavigationView{
            List {
                AddPlaceView { (success) in
                    if success == true {
                        self.placeListVM.fetchAllPlaces()
                    }
                }
                ForEach(self.placeListVM.places, id: \.id) {
                    item in
                    PlaceCell(placeVM: item)
                }
                .onDelete { (offsets) in
                    offsets.forEach { (index) in
                        let p = self.placeListVM.places[index]
                        self.placeListVM.deletePlace(id: p.id)
                    }
                }
            }
        .navigationBarTitle("Favorite Places")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
