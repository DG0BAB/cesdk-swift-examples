import SwiftUI

private class BundleIdentifier {}

public struct ContentsView: View {
//  @StateObject private var interactor = Interactor()

  @Environment(\.layoutDirection) private var layoutDirection

  private let zoomPadding: CGFloat = 16
  private let isEditing: Bool = false
  private let bundle: Bundle = Bundle.init(for: BundleIdentifier.self)
  @State private var interactivePopGestureRecognizer: UIGestureRecognizer?

  public init() {}
  
  public var body: some View {
    List {
      Image("woman", bundle: bundle)
    }
//    Canvas(zoomPadding: zoomPadding)
//      .allowsHitTesting(isEditing)
//      .navigationBarTitleDisplayMode(.inline)
//      .navigationBarBackButtonHidden(!isEditing)
//      .introspectNavigationController { navigationController in
//        // Disable swipe-back gesture and restore `onDisappear`
//        interactivePopGestureRecognizer = navigationController.interactivePopGestureRecognizer
//        interactivePopGestureRecognizer?.isEnabled = false
//      }
//      .toolbarBackground(.visible, for: .navigationBar)
//      .toolbar {
//        ToolbarItemGroup(placement: .principal) {
//        }
//        ToolbarItem(placement: .navigationBarTrailing) {
//        }
//      }
//      .onAppear {
//      }
//      .onWillDisappear {
//      }
//      .onDisappear {
//        interactivePopGestureRecognizer?.isEnabled = true
//      }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentsView()
  }
}
