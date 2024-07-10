import Common
import Customization
import LayoutTools
import SwiftUI
import Structure
import InteractionAndData

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
          Customization.Root()
        } label: {
          Text("Customização")
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

        NavigationLink {
          InteractionAndData.Root()
        } label: {
          Text("Interação e Dados")
            .font(.title)
            .padding(.vertical)
        }

        NavigationLink {
          WebView(url: URL(string: "https://apple.com/br"))
            .ignoresSafeArea(.container, edges: .bottom)
        } label: {
          Text("Interoperabilidade")
            .font(.title)
            .padding(.vertical)
        }

        NavigationLink {
          AdaptabilityView()
            .navigationTitle("Adaptability")
        } label: {
          Text("Multiplataforma")
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
