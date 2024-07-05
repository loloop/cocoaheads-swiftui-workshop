// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct SwiftUIKitView<T: UIView>: UIViewRepresentable {
  public init() {}
  public init(type: T.Type) {}
  public func makeUIView(context: Context) -> T { T() }
  public func updateUIView(_ uiView: T, context: Context) {}
}

public enum WorkshopItem {
  case answers(WorkshopAnswer)
}

public enum WorkshopAnswer {
  case customization(CustomizationAnswer)
  case layoutTools(LayoutAnswer)
  case interaction
  case dataFlow
  case interoperability
  case instagram
}

public extension View {
  func workshop(_ item: WorkshopItem) -> some View {
    switch item {
    case .answers(let answer):
      AnswerRoot(answer)
    }
  }
}
