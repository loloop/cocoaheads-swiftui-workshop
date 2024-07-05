import UIKit

final class UIKitSwitch: UIView {

  override init(frame: CGRect) {
    self.game = .init(system: .playstation)
    super.init(frame: frame)
    setUpView()
  }

  init(_ system: Game.System = .playstation) {
    self.game = .init(system: system)
    super.init(frame: .zero)
    setUpView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let game: Game

  let imageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    #if os(tvOS)
    #else
    $0.tintColor = .darkText
    #endif
    return $0
  }(UIImageView())

  func setUpView() {
    addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])

    var sfSymbol: String
    switch game.system {
    case .playstation:
      sfSymbol = "logo.playstation"
    case .xbox:
      sfSymbol = "logo.xbox"
    }
    imageView.image = UIImage(systemName: sfSymbol)
  }
}

#Preview("Playstation") {
  UIKitSwitch(.playstation)
}

#Preview("Xbox") {
  UIKitSwitch(.xbox)
}
