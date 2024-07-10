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

#Preview {
  WebView(url: URL(string: "https://apple.com/br"))
    .padding()
}
