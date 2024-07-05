import SwiftUI

struct SwiftUISubscriptionView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 24) {

      HStack {
        Text("Subscriptions")
          .font(.headline)

        Spacer()

        Image(systemName: "person.2")
          .foregroundStyle(.gray)
      }

      VStack(alignment: .leading, spacing: 6) {
        Text("+2350")
          .font(.largeTitle)

        Text("+180.1% from last month")
          .font(.callout)
          .foregroundStyle(.gray)
      }

    }
    .padding(24)
    .background {
      RoundedRectangle(cornerRadius: 10, style: .circular)
        .fill(.background)
        .stroke(.gray, lineWidth: 2)
        .shadow(color: .black.opacity(0.2), radius: 10)
    }
  }
}

#Preview {
  SwiftUISubscriptionView()
    .padding()
}
