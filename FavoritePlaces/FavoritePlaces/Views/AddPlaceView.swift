///**
/**
 
 FavoritePlaces
 CREATED BY:  DEVTECHIE INTERACTIVE, INC. ON 9/14/19
 COPYRIGHT (C) DEVTECHIE, DEVTECHIE INTERACTIVE, INC
 
 */

import SwiftUI

struct AddPlaceView: View {
    
    @State var name: String = ""
    @State var country: String = ""
    @State var notes: String = ""
    
    var onSave: (_ success: Bool) -> Void
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            TextField("Enter name here...", text: $name)
            Divider()
            TextField("Enter country here...", text: $country)
            Divider()
            TextField("Enter notes here...", text: $notes)
            Divider()
            HStack {
                Button("Save favorite place") {
                    self.savePlace()
                }
                .alert(isPresented: self.$showingAlert) {
                    Alert(title: Text("Saved!!!"), message: Text("Your favorite place is saved."), dismissButton: .default(Text("OK!")))
                }
                .disabled($name.wrappedValue.isEmpty && $country.wrappedValue.isEmpty && $notes.wrappedValue.isEmpty)
            }
            .font(.headline)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(15)
        }.padding()
    }
    
    func savePlace() {
        let vm = AddPlaceViewModel()
        vm.name = self.$name.wrappedValue
        vm.country = self.$country.wrappedValue
        vm.notes = self.$notes.wrappedValue
        vm.savePlace {
            self.showingAlert = true
            self.onSave(true)
            self.$name.wrappedValue = ""
            self.$country.wrappedValue = ""
            self.$notes.wrappedValue = ""
        }
    }
}
