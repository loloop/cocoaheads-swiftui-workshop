import SwiftUI

public struct AdaptabilityView: View {
  public init() {}

  @State var isToggledOn = false

  public var body: some View {
    List {
      Button("Sou um Button") {
        isToggledOn.toggle()
      }

      Toggle("Eu sou um toggle", isOn: $isToggledOn)

      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(.cyan)
        .frame(width: 100, height: 100)
        .contextMenu {
          Button("Também sou um Button!") {
            isToggledOn.toggle()
          }
          Toggle("Também sou um toggle", isOn: $isToggledOn)
        }
        .swipeActions(edge: .trailing) {
          Button("Eu também!") {
            isToggledOn.toggle()
          }
        }
    }
  }
}

#Preview {
  AdaptabilityView()
}
