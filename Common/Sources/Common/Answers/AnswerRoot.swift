import SwiftUI

struct AnswerRoot: View {

  init(_ answer: WorkshopAnswer) { self.answer = answer }
  let answer: WorkshopAnswer

  var body: some View {
    switch answer {
    case .layoutTools:
      Text("TODO Layout Tools")
    case .instagram:
      Text("TODO Instagram View")
    case .customization:
      Text("TODO Customization")
    case .interaction:
      Text("TODO Interaction")
    case .dataFlow:
      Text("TODO Data flow")
    case .interoperability:
      Text("TODO Interoperability")
    }
  }
}
