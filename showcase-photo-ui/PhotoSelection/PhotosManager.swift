//
//  PhotosManager.swift
//  Showcase-PhotoUI
//
//  Created by Joachim Deelen on 14.12.22.
//

import Foundation
import class UIKit.UIImage

/// Manages access to photos available for editing by the CESDK PhotoEditor
class PhotosManager {

  /// The `Array` with all photos available for editing.
  /// Might be empty
  let photos: [Photo]

  /// A single `Photo` for use by the CESDK PhotoEditor
  struct Photo: Identifiable {
    let id: String
    let url: URL
    let image: UIImage
  }

  /// Default instance of the `PhotosManager`.
  /// All photos available for editing will be loaded on first access.
  static let `default`: PhotosManager = {
    guard let photosURL = PhotoUI.bundle.resourceURL?.appending(path: "Photos", directoryHint: .isDirectory),
          let entries = try? FileManager.default.contentsOfDirectory(at: photosURL, includingPropertiesForKeys: nil) else {
      return PhotosManager(photos: [])
    }
    return PhotosManager(photos: entries.compactMap { url in
      guard let imageData = try? Data(contentsOf: url),
      let image = UIImage(data: imageData) else { return nil }
      return Photo(id: url.lastPathComponent, url: url, image: image)
    })
  }()

  private init(photos: [Photo]) {
    self.photos = photos
  }
}
