import SwiftUI
import Structure

struct RootView: View {
  var body: some View {
    NavigationStack {
      List {
        Section("Exemplos") {
          NavigationLink {
            Structure.Root()
          } label: {
            Text("Estrutura")
          }
        }

        Section("Exercícios") {
          NavigationLink {
            Text("Ferramentas de Layout")
          } label: {
            Text("Ferramentas de Layout")
          }
        }
      }
    }
  }
}

#Preview {
  RootView()
}
