import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State var isPresented = false
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50, longitude: 50),
        span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
    )
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Store.entity(), sortDescriptors: [])
    var stores: FetchedResults<Store>
    @State private var locations: [Location] = [
        Location(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
        Location(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
        Location(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(
                coordinate: location.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color("AccentColor"))
                            .frame(width: 40, height: 40)
                        Circle()
                            .strokeBorder(Color("ModeColor"), lineWidth: 3)
                            .frame(width: 40, height: 40)
                        Text("6")
                            .foregroundColor(Color("ModeColor"))
                            .bold()
                    }
                }
                .sheet(isPresented: $isPresented) {
                    CardView(isPresented: $isPresented)
                }
            }
        }
    }
}
