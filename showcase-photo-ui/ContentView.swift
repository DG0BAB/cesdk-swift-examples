import SwiftUI

/// Starting point for the photo-ui showcase
///
/// Presents a list of `Pphoto`s available for editing.
/// On selection of a `Photo` the `PhotoEditor` gets presented.
/// When editing ends, the list of available `Photo`s is presented again
public struct ContentView: View {

  @State private var orientation = UIDevice.current.orientation
  @State private var selection: PhotosManager.Photo? = nil

  public init() {}
  
  public var body: some View {
    PhotoSelectionView(photos: PhotosManager.default.photos, selection: $selection)
      .fullScreenCover(item: $selection) { photo in
        PhotoEditorView(photo: photo)
          .onDisappear { selection = nil }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
