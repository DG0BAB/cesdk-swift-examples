//
//  PhotoSelectionView.swift
//  Showcase-PhotoUI
//
//  Created by Joachim Deelen on 15.12.22.
//

import SwiftUI

/// Presents a list of `Photo`s from which one can be selected by the user
struct PhotoSelectionView: View {

  @State private var orientation = UIDevice.current.orientation
  @Binding private var selection: PhotosManager.Photo?

  private var photos: [PhotosManager.Photo]

  /// Initializes this `View` with a list of `Photo`s
  /// and a `Binding` for the user's selection`
  ///
  /// - Parameters:
  ///   - photos: `Array` with `Photo`s
  ///   - selection: `Binding` to store the `Photo` selected by the user
  init(photos: [PhotosManager.Photo], selection: Binding<PhotosManager.Photo?>) {
    self.photos = photos
    self._selection = selection
  }

  public var body: some View {
    ScrollView(orientation.isLandscape ? .horizontal : .vertical) {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 220, maximum: 240))]) {
        ForEach(photos, content: { photo in
          Image(uiImage: photo.image)
            .resizable()
            .aspectRatio(nil, contentMode: .fit)
            .onTapGesture {
              selection = photo
            }
        })
      }
    }
    .detectOrientation($orientation)
  }
}

struct PhotoSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoSelectionView(photos: PhotosManager.default.photos, selection: .constant(nil))
  }
}

