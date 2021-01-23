import SwiftUI

struct CardView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView() {
            ScrollView {
                Divider()
            }
            .navigationTitle(Text("STORE NAME HERE"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.isPresented = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
    }
}
