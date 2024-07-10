import SwiftUI

public struct Root: View {
  public init() {}

  public var body: some View {
    List {
      NavigationLink("Group") {
        SlideViews.GroupView()
      }

      NavigationLink("VStack") {
        SlideViews.VStackView()
      }

      NavigationLink("HStack") {
        SlideViews.HStackView()
      }

      NavigationLink("ZStack") {
        SlideViews.ZStackView()
      }

      NavigationLink("Spacer") {
        SlideViews.SpacerView()
      }

      NavigationLink("LayoutSystem") {
        SlideViews.LayoutSystem()
      }

      NavigationLink("Geometry Reader") {
        SlideViews.GeometryReaderView()
      }

      NavigationLink("ScrollView") {
        SlideViews.ScrollViewView()
      }

      NavigationLink("List") {
        SlideViews.ListView()
      }

      NavigationLink("Layout Priority") {
        SlideViews.LayoutPriorityView()
      }

    }
  }
}

#Preview {
  Root()
}
