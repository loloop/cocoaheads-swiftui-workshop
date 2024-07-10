import SwiftUI

@_spi(Answer) public enum LayoutAnswer {
  case first, second, third
}

struct LayoutTools: View {
  let answer: LayoutAnswer

  var body: some View {
    switch answer {
    case .first:
      Layout1()
    case .second:
      Layout2()
    case .third:
      Layout3()
    }
  }
}

struct Layout1: View {
  var body: some View {
    VStack {
      Customization3()
      Text("SF")
    }
  }
}

struct Layout2: View {
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Image(.highlight)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())

      Image(systemName: "plus.circle.fill")
        .resizable()
        .scaledToFit()
        .foregroundStyle(.blue)
        .frame(width: 30, height: 30)
        .background {
          Circle().fill(.white)
        }
        .overlay {
          Circle()
            .stroke(.white, lineWidth: 4)
        }
    }
    .frame(width: 100)
  }
}

struct Layout3: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        Layout1()
        Layout1()
        Layout1()
        Layout1()
        Layout1()
        Layout1()
        Layout1()
      }
      .padding(.horizontal, 50)
    }
    .scrollIndicators(.hidden)
  }
}

#Preview {
  VStack(spacing: 50) {
    Layout1()
    Layout2()
    Layout3()
  }
}
