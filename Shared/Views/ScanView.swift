import SwiftUI

struct ScanView: View {
    var body: some View {
        ScrollView {
            Image("camera")
                .resizable()
        }
        .ignoresSafeArea()
    }
}
