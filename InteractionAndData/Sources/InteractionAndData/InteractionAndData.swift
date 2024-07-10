import SwiftUI

public struct Root: View {
  public init() {}

  public var body: some View {
    List {
      NavigationLink("Counter") {
        SimpleCounter()
      }

      NavigationLink("Modifier") {
        ModifierView()
      }

      NavigationLink("Navigation") {
        NavigationExampleView()
      }
    }
  }
}
