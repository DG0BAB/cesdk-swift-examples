//
//  PhotoEditorView.swift
//  CESDK-Showcases
//
//  Created by Joachim Deelen on 15.12.22.
//

import SwiftUI

/// Presents a list of `Photo`s from which one can be selected by the user
struct PhotoEditorView: View {

  @Environment(\.dismiss) private var dismiss

  private var photo: PhotosManager.Photo


  /// Initializes this `View` with the `Photo`s to be edited
  ///
  /// - Parameters:
  ///   - photo: The `Photo` to be edited
  init(photo: PhotosManager.Photo) {
    self.photo = photo
  }

  public var body: some View {
    Text(photo.id)
      .background {
        Color.green
      }
      .onTapGesture {
        dismiss()
      }
  }
}

struct PhotoEditor_Previews: PreviewProvider {
  static var previews: some View {
    PhotoEditorView(photo: PhotosManager.default.photos[1])
  }
}
