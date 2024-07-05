import SwiftUI

public struct Root: View {
  public init() {}
  
  public var body: some View {
    List {
      Section("SwiftUI") {
        NavigationLink("Switch") {
          SwiftUISwitch(game: .init(system: .playstation))
        }

        NavigationLink("Subscription Cell") {
          SwiftUISubscriptionView()
            .padding()
        }
      }

      Section("UIKit") {
        NavigationLink("Switch") {
          SwiftUIKitView<UIKitSwitch>()
        }

        NavigationLink("Subscription Cell") {
          SwiftUIKitView<UIKitSubscriptionView>()
            .padding()
            .frame(height: 200)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    Root()
  }
}
