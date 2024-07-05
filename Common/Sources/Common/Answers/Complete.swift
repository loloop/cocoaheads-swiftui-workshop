import SwiftUI

struct CompletePackageView: View {
  var body: some View {
    VStack {
      EmptyView()
        .workshop(.answers(.layoutTools(.second)))

      HStack {
        EmptyView()
          .workshop(.answers(.customization(.first)))

        EmptyView()
          .workshop(.answers(.customization(.first)))

        EmptyView()
          .workshop(.answers(.customization(.second)))
      }

      EmptyView()
        .workshop(.answers(.layoutTools(.third)))
    }
  }
}

#Preview {
  CompletePackageView()
}
