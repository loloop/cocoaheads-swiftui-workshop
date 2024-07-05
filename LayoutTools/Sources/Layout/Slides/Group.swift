import SwiftUI

struct GroupView: View {
  var body: some View {
    Group {
      Text("I am a text")
      Text("I am a different text")
      Image(systemName: "flag.pattern.checkered.2.crossed")
    }
  }
}

struct VStackView: View {
  var body: some View {
    VStack(alignment: .trailing, spacing: 20) {
      Text("I am a text")
      Text("I am a different text")
      Image(systemName: "flag.pattern.checkered.2.crossed")
    }
  }
}

struct HStackView: View {
  var body: some View {
    HStack(alignment: .firstTextBaseline, spacing: 20) {
      Text("I am a text")
      Text("I am a different text")
      Image(systemName: "flag.pattern.checkered.2.crossed")
    }
  }
}

struct SpacerView: View {
  var body: some View {
    HStack {
      Text("Some text")
      Spacer()
      Image(systemName: "rectangle.on.rectangle.circle.fill")
    }
  }
}

#Preview("Group") {
  GroupView()
}

#Preview("VStack") {
  VStackView()
}

#Preview("HStack") {
  HStackView()
}

#Preview("Spacer") {
  SpacerView()
    .padding()
}
