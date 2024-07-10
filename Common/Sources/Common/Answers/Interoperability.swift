import SwiftUI
import UIKit
import WebKit

public struct WebView: UIViewRepresentable {
  public init(url: URL?) {
    self.url = url!
  }

  let url: URL

  public func makeUIView(context: Context) -> WKWebView  {
    return WKWebView()
  }

  public func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.load(urlRequest(url))
  }

  func urlRequest(_ url: URL) -> URLRequest {
    return URLRequest(url: url)
  }
}

#Preview("WebView") {
  WebView(url: URL(string: "https://apple.com/br"))
    .padding()
}

@_spi(Answer) public struct AttributedStringView: UIViewRepresentable {
  let attributedString: NSAttributedString
  
  public init(attributedString: NSAttributedString) {
    self.attributedString = attributedString
  }

  public func makeUIView(context: Context) -> UITextView {
    {
      $0.isEditable = false
      return $0
    }(UITextView())
  }

  public func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.attributedText = attributedString
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator()
  }

  public final class Coordinator: NSObject, UITextViewDelegate {
    public func textView(
      _ textView: UITextView,
      shouldInteractWith URL: URL,
      in characterRange: NSRange, 
      interaction: UITextItemInteraction
    ) -> Bool {
      UIApplication.shared.open(URL)
      return false
    }
  }
}

@_spi(Answer) public let attributedString: NSAttributedString = {
  let string = NSMutableAttributedString(string: "Este link é clicável")
  let linkRange = string.mutableString.range(of: "link")
  string.addAttribute(.link, value: URL(string: "https://apple.com/br")!, range: linkRange)
  return string
}()

#Preview("AttributedString") {
  NavigationStack {
    AttributedStringView(attributedString: attributedString)
  }
}
