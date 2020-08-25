///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import SwiftUI
import CoreData
import Combine

class PlaceListViewModel: ObservableObject {
    
    @Published
    var places = [PlaceViewModel]()
    
    init() {
        fetchAllPlaces()
    }
    
    func fetchAllPlaces() {
        self.places = DataManager.shared.getPlaces().map({ (place) -> PlaceViewModel in
            return PlaceViewModel(id: place.id!,name: place.name!, country: place.country!, notes: place.notes!, image: place.image!)
        })
        print(self.places)
    }
    func deletePlace(id: UUID) {
        DataManager.shared.deletePlace(id: id)
        self.places.removeAll { (pvm) -> Bool in
            return pvm.id == id
        }
    }
}
