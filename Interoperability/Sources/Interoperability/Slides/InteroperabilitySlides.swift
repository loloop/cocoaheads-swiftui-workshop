import SwiftUI
import UIKit
import LinkPresentation

struct UIKitLinkPresentationViewRepresentable: UIViewRepresentable {
  let url: URL

  func makeUIView(context: Context) -> LPLinkView {
    LPLinkView(url: url)
  }

  func updateUIView(_ uiView: LPLinkView, context: Context) {}
}

#Preview {
  UIKitLinkPresentationViewRepresentable(url: URL(string: "https://apple.com")!)
}
