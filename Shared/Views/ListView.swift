import SwiftUI

struct ListView: View {
    @State var distance: Double = 100
    @State var isPresented = false
    @State var isPresented2 = false
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Store.entity(), sortDescriptors: [])
    var stores: FetchedResults<Store>
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                MapView()
                    .frame(height: 250)
                    .allowsHitTesting(false)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("ModeColor"))
                        .cornerRadius(10)
                        .frame(height: 95)
                    VStack(spacing: 10) {
                        HStack {
                            Text("Distance: \(distance, specifier: "%.f") km")
                            Spacer()
                            Button(action: {
                                self.isPresented.toggle()
                            }) {
                                HStack {
                                    Text("Add store")
                                        .bold()
                                    Image(systemName: "plus.circle")
                                        .imageScale(.large)
                                }
                            }
                            .sheet(isPresented: $isPresented) {
                                    AddStoreView(isPresented: $isPresented)
                            }
                        }
                        Slider(value: $distance, in: 0...300, step: 1)
                    }
                    .padding()
                }
                .padding()
            }
            List {
                ForEach(stores.reversed()) { store in
                    Button(action: {
                        self.isPresented2.toggle()
                    }) {
                        HStack {
                            Text("\(store.name ?? "")")
                            Spacer()
                            Text("\(store.latitude, specifier: "%.3f"),")
                            Text("\(store.longitude, specifier: "%.3f")")
                        }
                        .frame(height: 50)
                    }
                    .sheet(isPresented: $isPresented2) {
                            CardView(isPresented: $isPresented2)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .ignoresSafeArea()
    }
}
