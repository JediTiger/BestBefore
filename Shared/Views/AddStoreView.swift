import SwiftUI

struct AddStoreView: View {
    @State var storeName = ""
    @State var storeLatitude = ""
    @State var storeLongitude = ""
    @Environment (\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Store name", text: $storeName)
                    
                }
                Section(header: Text("Coordinates")) {
                    TextField("Latitude", text: $storeLatitude)
                        .keyboardType(.numberPad)
                    TextField("Longitude", text: $storeLongitude)
                        .keyboardType(.numberPad)
                }
                Button(action: {
                    guard self.storeName != "" else {return}
                    let newStore = Store(context: viewContext)
                    newStore.name = self.storeName
                    newStore.id = UUID()
                    newStore.latitude = (self.storeLatitude as NSString).doubleValue
                    newStore.longitude = (self.storeLongitude as NSString).doubleValue
                    do {
                        try viewContext.save()
                        print("Store saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add store")
                        .bold()
                }
            }
            .navigationTitle("Add store")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(Color("ModeColor"))
                })
        }
    }
}
