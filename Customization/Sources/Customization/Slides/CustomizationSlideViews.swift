import SwiftUI

struct ModifierExampleView: View {
  var body: some View {
    Text("Oi! Eu sou um texto")
      .workshopStyle()
  }
}

extension View {
  func workshopStyle() -> some View {
    self
      .modifier(WorkshopModifier())
  }
}

struct WorkshopModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .italic()
      .fontDesign(.monospaced)
      .foregroundStyle(.yellow)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(.cyan)
      }
  }
}

#Preview {
  ModifierExampleView()
}
