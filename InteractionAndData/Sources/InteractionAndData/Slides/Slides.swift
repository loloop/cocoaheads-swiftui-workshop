import Common
import SwiftUI

// MARK: - Counter

struct SimpleCounter: View {
  var body: some View {
    EmptyView()
  }
}

#Preview("Counter") {
  SimpleCounter()
}

// MARK: - ViewModifiers

struct ModifierView: View {
  var body: some View {
    Text("Oi! eu sou um texto")
      .workshop()
  }
}

extension View {
  func workshop() -> some View {
    self.modifier(WorkshopModifier())
  }
}

struct WorkshopModifier: ViewModifier {
  @State var isBackgroundGreen = false

  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .italic()
      .fontDesign(.monospaced)
      .foregroundStyle(.yellow)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
          .fill(isBackgroundGreen ? .green : .cyan)
      }
      .onTapGesture {
        withAnimation {
          isBackgroundGreen.toggle()
        }
      }
  }
}

extension View {
  // @State var isBackgroundGreen = false

  func workshopStyle() -> some View {
    self
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

#Preview("ViewModifier") {
  ModifierView()
}

// MARK: - ForEach

struct ForEachView: View {
  var body: some View {
    EmptyView()
  }
}

#Preview("ForEach") {
  ForEachView()
}

// MARK: - Navigation

struct NavigationExampleView: View {
  var body: some View {
    NavigationStack {
      NavigationLink("Uma tela") {
        Text("Uma tela mesmo!")
      }

      NavigationLink {
        NavigationStack {
          NavigationLink("Mais uma tela") {
            Text("Chegamos ao final")
          }
        }
      } label: {
        Label("Outra tela", systemImage: "logo.playstation")
      }
    }
  }
}

#Preview("Navigation") {
  NavigationExampleView()
}


