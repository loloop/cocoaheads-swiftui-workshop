// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

@_spi(Answer) public struct SwiftUIKitView<T: UIView>: UIViewRepresentable {
  public init() {}
  public init(type: T.Type) {}
  public func makeUIView(context: Context) -> T { T() }
  public func updateUIView(_ uiView: T, context: Context) {}
}

@_spi(Answer) public enum WorkshopItem {
  case answers(WorkshopAnswer)
}

@_spi(Answer) public enum WorkshopAnswer {
  case customization(CustomizationAnswer)
  case layoutTools(LayoutAnswer)
  case interaction
  case dataFlow
  case interoperability
  case instagram
}

@_spi(Answer) public struct WorkshopAnswerView: View {
  public init(_ answer: WorkshopAnswer) {
    self.answer = answer
  }

  let answer: WorkshopAnswer

  public var body: some View {
    AnswerRoot(answer)
  }
}

@_spi(Answer) public extension View {
  func workshop(_ item: WorkshopItem) -> some View {
    switch item {
    case .answers(let answer):
      AnswerRoot(answer)
    }
  }
}
