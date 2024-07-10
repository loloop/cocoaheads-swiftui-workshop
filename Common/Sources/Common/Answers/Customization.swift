import SwiftUI

@_spi(Answer) public enum CustomizationAnswer {
  case first, second, third
}

struct Customization1: View {
  let text: String
  var body: some View {
    Text(text)
      .font(.system(size: 12, design: .rounded))
      .bold()
      .padding(10)
      .padding(.horizontal, 25)
      .background {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(.quinary)
      }
  }
}

struct Customization2: View {
  var body: some View {
    Image(systemName: "person.badge.plus")
      .font(.system(size: 14))
      .padding(8)
      .background {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(.quinary)
      }
  }
}

struct Customization3: View {
  var body: some View {
    Image(.highlight)
      .resizable()
      .clipShape(Circle())
      .overlay {
        Circle()
          .stroke(.white, lineWidth: 10)

        Circle()
          .stroke(.gray, lineWidth: 1)
      }
      .frame(width: 80, height: 80)
  }
}

struct Customization: View {
  let answer: CustomizationAnswer

  var body: some View {
    switch answer {
    case .first:
      Customization1(text: "Edit profile")
    case .second:
      Customization2()
    case .third:
      Customization3()
    }
  }
}

#Preview {
  HStack {
    Customization1(text: "Edit profile")
    Spacer()
    Customization2()
    Spacer()
    Customization3()
  }
  .padding()
}
