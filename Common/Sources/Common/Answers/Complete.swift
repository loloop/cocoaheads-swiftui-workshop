import SwiftUI

struct CompletePackageView: View {
  var body: some View {
    VStack {
      WorkshopAnswerView(.layoutTools(.second))

      HStack {
        WorkshopAnswerView(.customization(.first))

        WorkshopAnswerView(.customization(.first))

        WorkshopAnswerView(.customization(.second))

      }

      WorkshopAnswerView(.layoutTools(.third))
    }
  }
}

#Preview {
  CompletePackageView()
}
