import LayoutTools
import SwiftUI
import Structure

struct RootView: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          Structure.Root()
        } label: {
          Text("Estrutura")
            .font(.title)
            .padding(.vertical)
        }

        NavigationLink {
          LayoutTools.Root()
        } label: {
          Text("Ferramentas de Layout")
            .font(.title)
            .padding(.vertical)
        }
      }
    }
  }
}

#Preview {
  RootView()
}

// TODOs
// TODO: Add icon for all app versions
// TODO: Add widgets
