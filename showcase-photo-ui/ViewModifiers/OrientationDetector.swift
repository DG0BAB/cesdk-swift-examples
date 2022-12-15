//
//  OrientationDetector.swift
//  Showcase-PhotoUI
//
//  Created by Joachim Deelen on 14.12.22.
//

import SwiftUI

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
  func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
    modifier(OrientationDetector(orientation: orientation))
  }
}
