//
//  OrientationDetector.swift
//  Showcase-PhotoUI
//
//  Created by Joachim Deelen on 14.12.22.
//

import SwiftUI

/// A `ViewModifier` for detecting orientation changes of the device
struct OrientationDetector: ViewModifier {

  @Binding var orientation: UIDeviceOrientation

  func body(content: Content) -> some View {
    content
      .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
        orientation = UIDevice.current.orientation
      }
  }
}

extension View {

  /// Detects orientation changes of the device and stores the detected, new
  /// orientation into the given `Binding`
  /// - Parameter orientation: `Binding` for the detected, new orientation
  /// - Returns: A copy of this `View`, modified to detect orientation changes
  func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
    modifier(OrientationDetector(orientation: orientation))
  }
}
