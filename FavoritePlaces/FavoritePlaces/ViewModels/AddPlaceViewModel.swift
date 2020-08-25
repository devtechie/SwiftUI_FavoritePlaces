///**
/**

FavoritePlaces
CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/15/19
COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC

*/

import Foundation
class AddPlaceViewModel {
    var name: String = ""
    var country: String = ""
    var notes: String = ""
    
    func savePlace(saved: @escaping () -> Void) {
        let encodedName = self.name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        URLSession.shared.dataTask(with: URL(string: "https://source.unsplash.com/1600x900/?\(encodedName!)")!) { (data, response, error) in
            DataManager.shared.savePlace(name: self.name, country: self.country, notes: self.notes, imageData: data!)
            saved()
        }.resume()
    }
}
