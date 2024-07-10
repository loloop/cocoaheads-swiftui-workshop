@_spi(Answer) import Common
import SwiftUI

enum SlideViews {
  struct GroupView: View {
    var body: some View {
      Group {
        Text("I am a text")
          .fontDesign(.monospaced)
        Text("I am a different text")
          .fontDesign(.monospaced)
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

  struct ZStackView: View {
    var body: some View {
      ZStack(alignment: .center) {
        RoundedRectangle(
          cornerRadius: 20,
          style: .continuous)
        .fill(.green)
        .frame(width: 100, height: 100)

        Circle()
          .frame(width: 50, height: 50)
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

  struct LayoutSystem: View {
    var body: some View {
      let view = VStack {
        RoundedRectangle(
          cornerRadius: 20, style: .circular)
        RoundedRectangle(
          cornerRadius: 20, style: .circular)
      }
      print(type(of: view))
      return view
    }
  }

  struct GeometryReaderView: View {
    var body: some View {
      GeometryReader { proxy in
        Rectangle()
          .frame(width: proxy.size.width/2)
      }
    }
  }

  struct ScrollViewView: View {
    var body: some View {
      ScrollView {
        WorkshopAnswerView(.customization(.first))
        WorkshopAnswerView(.customization(.first))
        WorkshopAnswerView(.customization(.first))
        WorkshopAnswerView(.customization(.first))
        WorkshopAnswerView(.customization(.first))

        ScrollView(.horizontal) {
          HStack {
            WorkshopAnswerView(.customization(.first))
            WorkshopAnswerView(.customization(.first))
            WorkshopAnswerView(.customization(.first))
          }
        }
        .scrollIndicators(.hidden)
      }
    }
  }

  struct ListView: View {
    var body: some View {
      List {
        Section("Customization") {
          WorkshopAnswerView(.customization(.first))
          WorkshopAnswerView(.customization(.first))
          WorkshopAnswerView(.customization(.first))
          WorkshopAnswerView(.customization(.first))
          WorkshopAnswerView(.customization(.first))
        }

        Section("Layout tools") {
          ScrollView(.horizontal) {
            HStack {
              WorkshopAnswerView(.customization(.first))
              WorkshopAnswerView(.customization(.first))
              WorkshopAnswerView(.customization(.first))
            }
          }
        }
      }
    }
  }

  struct LayoutPriorityView: View {
    var body: some View {
      HStack {
        Text("CocoaHeads")
        Text("São Paulo")
        Text("na Thoughtworks")
          .layoutPriority(1)
      }
      .font(.largeTitle)
    }
  }
}

#Preview("Group") {
  SlideViews.GroupView()
}

#Preview("VStack") {
  SlideViews.VStackView()
}

#Preview("HStack") {
  SlideViews.HStackView()
}

#Preview("ZStack") {
  SlideViews.ZStackView()
}

#Preview("Spacer") {
  SlideViews.SpacerView()
    .padding()
}

#Preview("Layout System") {
  SlideViews.LayoutSystem()
}

#Preview("GeometryReader") {
  SlideViews.GeometryReaderView()
}

#Preview("ScrollView") {
  SlideViews.ScrollViewView()
}

#Preview("List") {
  SlideViews.ListView()
}

#Preview("Priority") {
  SlideViews.LayoutPriorityView()
}
