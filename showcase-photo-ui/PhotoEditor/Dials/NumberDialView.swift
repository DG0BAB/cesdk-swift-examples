//
//  NumberDialView.swift
//  Showcase-PhotoUI
//
//  Created by Joachim Deelen on 19.12.22.
//

import SwiftUI

struct NumberDialView: View {

  @State private var currentValue: Int

  // Configuration constants
  private let dotWidth: CGFloat = 2
  private let dotSpacing: CGFloat = 8
  private let maskColor = Color(red: 0.85, green: 0.85, blue: 0.85)

  private let values: Range<Int>

  init(values: Range<Int>, startValue: Int = 0) {
    self.values = values
    self.currentValue = startValue
  }

  public var body: some View {
    GeometryReader { geo in
      VStack {
        Spacer()
        ZStack {

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: dotSpacing) {
              let padding = (geo.size.width / 2) - (dotWidth + dotSpacing)
              Color.clear.padding(.leading, padding)
              ForEach(values, id: \.self) { value in
                value % 5 == 0
                ? Image("dot.dial.fifth.fill", bundle: PhotoUI.bundle)
                : Image("dot.dial.fill", bundle: PhotoUI.bundle)
              }
              Color.clear.padding(.trailing, padding)
            }
            .background(GeometryReader { proxy in
              let contentOffset = proxy.frame(in: .named("scroll-space")).minX
              Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: -contentOffset)
            })
            .frame(height: 42)
          }
          .mask {
            Rectangle().fill(.linearGradient(colors: [maskColor.opacity(0.25), maskColor.opacity(1.0), maskColor.opacity(0.25)],
                                             startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))
            )
          }
          //      .onAppear {
          //        UIScrollView.appearance().bounces = false
          //      }
          //      .onDisappear {
          //        UIScrollView.appearance().bounces = true
          //      }
          .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
            currentValue = Int(value / (dotSpacing + dotWidth))
          })
          .coordinateSpace(name: "scroll-space")

          Text("\(currentValue)")
            .bold()
            .font(.body)
            .background(.white.opacity(1))
        }
      }
    }
  }
}

private struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  typealias Value = CGFloat
  static var defaultValue = CGFloat.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value += nextValue()
  }
}



struct HorizontalNumberDialView_Previews: PreviewProvider {
  static var previews: some View {
    NumberDialView(values: 1..<100)
  }
}
