import SwiftUI

struct RandomNumberView: View {

  let randomNumber = Int.random(in: 1...100)

  var body: some View {
    Text("\(randomNumber)")
  }
}

struct RandomNumberViewLifecycle: View {

  @State var randomNumber: Int?

  var body: some View {
    HStack {
      if let randomNumber {
        Text("\(randomNumber)")
      }
    }
    .onAppear {
      randomNumber = Int.random(in: 1...100)
    }
    .onDisappear {
      randomNumber = nil
    }
  }
}

struct AsyncRandomNumberViewLifecycle: View {

  @State var randomNumber: Int?

  var body: some View {
    HStack {
      if let randomNumber {
        Text("\(randomNumber)")
      } else {
        ProgressView()
      }
    }
    .task {
      try? await Task.sleep(for: .seconds(2))
      randomNumber = Int.random(in: 1...100)
    }
  }
}

#Preview("Random") {
  RandomNumberView()
    .font(.largeTitle)
}

#Preview("Random OnAppear") {
  RandomNumberViewLifecycle()
    .font(.largeTitle)
}


#Preview("Random OnAppear") {
  AsyncRandomNumberViewLifecycle()
    .font(.largeTitle)
}
