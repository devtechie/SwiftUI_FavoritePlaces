///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation

class PlaceViewModel {
    var id: UUID
    var name: String
    var country: String
    var notes: String
    var image: Data
    init(id: UUID, name: String, country: String, notes: String, image: Data) {
        self.id = id
        self.name = name
        self.country = country
        self.notes = notes
        self.image = image
    }
}

//class DummyData {
//    static func mockPlaces() -> [PlaceViewModel] {
//        return [
//            PlaceViewModel(name: "London", country: "UK", notes: "Really beautiful city"),
//            PlaceViewModel(name: "San Francisco", country: "USA", notes: "Best food"),
//            PlaceViewModel(name: "San Diego", country: "USA", notes: "Best Mexican Food in USA")
//        ]
//    }
//}
