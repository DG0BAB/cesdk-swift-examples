import SwiftUI

struct BottomToolbarView: View {

  @Environment(\.dismiss) private var dismiss
  @State private var value: Int = 0

  var body: some View {
    VStack(spacing: 0) {
      NumberDialView(values: 1..<100)
      HStack(spacing: 0) {
        Button("Cancel", action: {dismiss() })
        Spacer()
        HStack(spacing: 24) {
          Group {
            Button(action: {}, label: { Label("Brightness", systemImage: "dial.low") })
            Button(action: {}, label: { Label("Filter", systemImage: "camera.filters") })
            Button(action: {}, label: { Label("Crop", systemImage: "crop.rotate") })
          }
          .fixedSize()
        }
        .labelStyle(.iconOnly)
        Spacer()
        Button("Export", action: {})
      }
      .padding()
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbarView()
  }
}
