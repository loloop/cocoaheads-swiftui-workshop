import SwiftUI

struct LinkableTextView: View {
  var body: some View {
    VStack {
      Text(text)
    }
  }

  let text = """
link do google: [https://google.com](https://google.com)
"""
}

#Preview {
  LinkableTextView()
}
