import Foundation

/// Manages access to photos available for editing by the CESDK PhotoEditor
class PhotosManager {

  /// The `Array` with all photos available for editing.
  /// Might be empty
  let photos: [Photo]

  /// A single `Photo` for use by the CESDK PhotoEditor
  struct Photo: Identifiable {
    let id: String
    let url: URL
  }

  /// Default instance of the `PhotosManager`.
  /// All photos available for editing will be loaded on first access.
  static let `default`: PhotosManager = {
    guard let photosURL = PhotoUI.bundle.resourceURL?.appending(path: "Photos", directoryHint: .isDirectory),
          let entries = try? FileManager.default.contentsOfDirectory(at: photosURL, includingPropertiesForKeys: nil) else {
      return PhotosManager(photos: [])
    }
    return PhotosManager(photos: entries.map { Photo(id: $0.lastPathComponent, url: $0) })
  }()

  private init(photos: [Photo]) {
    self.photos = photos
  }
}
