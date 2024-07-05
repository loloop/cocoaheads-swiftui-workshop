import SwiftUI

struct SwiftUISwitch: View {
  let game: Game

  var body: some View {
    switch game.system {
    case .playstation:
      Image(systemName: "logo.playstation")
    case .xbox:
      Image(systemName: "logo.xbox")
    }
  }
}

#Preview("Playstation") {
  SwiftUISwitch(game: .init(system: .playstation))

}

#Preview("Xbox") {
  SwiftUISwitch(game: .init(system: .xbox))
}
