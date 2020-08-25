///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager(context: NSManagedObjectContext.current)
    
    var context: NSManagedObjectContext
    
    private init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    // get all places
    
    func getPlaces() -> [Place] {
        var places = [Place]()
        let placeRequest: NSFetchRequest<Place> = Place.fetchRequest()
        
        do {
            places = try self.context.fetch(placeRequest)
        } catch let error as NSError {
            print(error)
        }
        return places
    }
    
    // save the place
    func savePlace(name: String, country: String, notes: String, imageData: Data) {
        let place = Place(context: self.context)
        place.id = UUID()
        place.name = name
        place.country = country
        place.notes = notes
        place.image = imageData
        
        do {
            try self.context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    // delete a place
    func deletePlace(id: UUID) {
        let fetchRequest: NSFetchRequest<Place> = Place.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        do {
            let fetchedPlaces = try context.fetch(fetchRequest)
            for pl in fetchedPlaces {
                context.delete(pl)
            }
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
