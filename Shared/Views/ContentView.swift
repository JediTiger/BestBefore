import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .ignoresSafeArea()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            ListView()
                .tabItem {
                    Image(systemName: "filemenu.and.selection")
                    Text("List")
                }
            ScanView()
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("Scan")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
