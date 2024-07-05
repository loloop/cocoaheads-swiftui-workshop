import Common
import SwiftUI
import UIKit

final class UIKitSubscriptionView: UIView {

  override init(frame: CGRect) {
    super.init(frame: .zero)
    setUpViews()
  }

  init() {
    super.init(frame: .zero)
    setUpViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let subscriptionTitle = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "Subscriptions"
    $0.font = .preferredFont(forTextStyle: .headline)
    return $0
  }(UILabel())

  let subscriberCountLabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "+2350"
    $0.font = .preferredFont(forTextStyle: .largeTitle)
    return $0
  }(UILabel())
  
  let subscriberPercentageLabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.text = "+180.1% from last month"
    $0.font = .preferredFont(forTextStyle: .callout)
    $0.textColor = .systemGray
    return $0
  }(UILabel())

  let flavorIcon = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.image = UIImage(systemName: "person.2")
    $0.tintColor = .systemGray
    return $0
  }(UIImageView())

  func setUpViews() {
    directionalLayoutMargins = .init(top: 24, leading: 24, bottom: 24, trailing: 24)

    layer.cornerRadius = 10
    layer.borderColor = UIColor(.gray).cgColor
    layer.borderWidth = 2

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowRadius = 10
    backgroundColor = .systemBackground

    [
      subscriptionTitle,
      subscriberCountLabel,
      subscriberPercentageLabel,
      flavorIcon
    ].forEach {
        addSubview($0)
    }

    NSLayoutConstraint.activate([
      subscriptionTitle.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      subscriptionTitle.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      subscriptionTitle.trailingAnchor.constraint(lessThanOrEqualTo: flavorIcon.leadingAnchor),

      flavorIcon.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      flavorIcon.centerYAnchor.constraint(equalTo: subscriptionTitle.centerYAnchor),

      subscriberCountLabel.topAnchor.constraint(equalTo: subscriptionTitle.bottomAnchor, constant: 24),
      subscriberCountLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),

      subscriberPercentageLabel.topAnchor.constraint(equalTo: subscriberCountLabel.bottomAnchor, constant: 6),
      subscriberPercentageLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      subscriberPercentageLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
    ])
  }
}

#Preview {
  SwiftUIKitView<UIKitSubscriptionView>()
    .padding()
    .frame(height: 200)
}
