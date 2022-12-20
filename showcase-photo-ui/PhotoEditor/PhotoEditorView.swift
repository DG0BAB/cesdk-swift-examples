//
//  PhotoEditorView.swift
//  CESDK-Showcases
//
//  Created by Joachim Deelen on 15.12.22.
//

import SwiftUI
import IMGLYEngine

/// Presents a `Photo` in the CE.SDK Canvas for editing
struct PhotoEditorView: View {

  @StateObject private var engine: Engine = Engine()
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
    NavigationStack {
      Canvas(engine: engine)
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
        .onAppear {
          Task {
            try? await engine.scene.create(from: photo.url)
          }
        }
        .toolbar {
          ToolbarItemGroup {
            Button("Revert All", action: {})
          }
        }
        .ignoresSafeArea()
        .overlay(alignment: .bottom) {
          BottomToolbarView()
        }
    }
  }
}

struct PhotoEditor_Previews: PreviewProvider {
  static var previews: some View {
    PhotoEditorView(photo: PhotosManager.default.photos[1])
  }
}
