import SwiftUI

// MARK: - Hacker News App

@_spi(Hacker) public struct NewsItem: Codable, Hashable, Identifiable {
  public let id: Int
  let title: String
  let points: Int?
  let user: String?
  let timeAgo: String
  let commentsCount: Int
  let url: String
  let domain: String?
}

@_spi(Hacker) public struct HackerNewsService {
  public static func fetchNews() async throws -> [NewsItem] {
    guard let url = URL(
      string: "https://api.hackerwebapp.com/news?page=1")
    else {
      throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let news = try decoder.decode([NewsItem].self, from: data)
    return news
  }
}

@_spi(Hacker) public enum APIState<T: Codable, U: Error> {
  case idle
  case loading
  case error(U)
  case finished(T)
}

struct StatefulHackerView: View {
  @State var apiState = APIState<[NewsItem], Error>.idle

  var body: some View {
    Group {
      switch apiState {
      case .idle:
        Color.clear
      case .loading:
        ProgressView()
      case .error(let error):
        ErrorView(error: error) {
          await fetchNews()
        }
      case .finished(let news):
        newsList(news)
      }
    }
    .task {
      await fetchNews()
    }
  }

  @ViewBuilder @MainActor
  func newsList(_ news: [NewsItem]) -> some View {
    List(news) { new in
      HackerNewsItemView(item: new)
    }
  }

  func fetchNews() async {
    apiState = .loading
    do {
      let news = try await HackerNewsService.fetchNews()
      apiState = .finished(news)
    } catch(let error) {
      apiState = .error(error)
    }
  }
}

final class ObservedObjectHackerViewModel: ObservableObject {
  @Published var apiState = APIState<[NewsItem], Error>.idle

  func fetchNews() async {
    apiState = .loading
    do {
      let news = try await HackerNewsService.fetchNews()
      apiState = .finished(news)
    } catch(let error) {
      apiState = .error(error)
    }
  }
}

struct ObservedHackerView: View {

  @StateObject var viewModel = ObservedObjectHackerViewModel()

  var body: some View {
    Group {
      switch viewModel.apiState {
      case .idle:
        Color.clear
      case .loading:
        ProgressView()
      case .error(let error):
        ErrorView(error: error) {
          await viewModel.fetchNews()
        }

      case .finished(let news):
        newsList(news)
      }
    }
    .task {
      await viewModel.fetchNews()
    }
  }

  @ViewBuilder @MainActor
  func newsList(_ news: [NewsItem]) -> some View {
    List(news) { new in
      HackerNewsItemView(item: new)
    }
  }
}

import Observation

@Observable
class HackerNewsViewModel {
  var apiState = APIState<[NewsItem], Error>.idle

  func fetchNews() async {
    apiState = .loading
    do {
      let news = try await HackerNewsService.fetchNews()
      apiState = .finished(news)
    } catch(let error) {
      apiState = .error(error)
    }
  }
}

struct ObservationHackerView: View {
  @State var viewModel = HackerNewsViewModel()

  var body: some View {
    Group {
      switch viewModel.apiState {
      case .idle:
        Color.clear
      case .loading:
        ProgressView()
      case .error(let error):
        ErrorView(error: error) {
          await viewModel.fetchNews()
        }
      case .finished(let news):
        newsList(news)
      }
    }
    .task {
      await viewModel.fetchNews()
    }
  }

  @ViewBuilder @MainActor
  func newsList(_ news: [NewsItem]) -> some View {
    List(news) { new in
      HackerNewsItemView(item: new)
    }
  }
}

@_spi(Hacker) public struct ErrorView: View {
  public init(
    error: Error,
    retryAction: @escaping () async -> Void)
  {
    self.error = error
    self.retryAction = retryAction
  }

  let error: Error
  let retryAction: () async -> Void

  public var body: some View {
    ContentUnavailableView {
      Text("Something has gone wrong :/")
    } description: {
      Text(error.localizedDescription)
    } actions: {
      Button("Retry") {
        Task {
          await retryAction()
        }
      }
    }
  }
}

@_spi(Hacker) public struct HackerNewsItemView: View {
  public init(item: NewsItem) {
    newsItem = item
  }

  let newsItem: NewsItem

  public var body: some View {
    VStack(alignment: .leading) {
      Text(newsItem.title)
        .font(.title2)

      Text(newsItem.user == nil ? "" : "by \(newsItem.user!)")
        .font(.caption)
    }
  }
}

#Preview("Everything in view") {
  StatefulHackerView()
}

#Preview("ObservableObject and StateObject") {
  ObservedHackerView()
}

#Preview("Observation Framework") {
  ObservationHackerView()
}

// MARK: - Counter

struct SimpleCounter: View {
  @State var counter = 0.0
  var body: some View {
    HStack {
      Button("-") {
        counter -= 1
      }

      Text("\(counter)")

      Button("+") {
        counter += 1
      }
    }
  }
}

struct SharedStateCounter: View {
  @State var counter = 0
  @State var isCounterVisible = true

  var body: some View {
    VStack {
      if isCounterVisible {
        InternalCounter(counter: $counter)
      }

      InternalCounter(counter: $counter)

      Button("Show top counter") {
        isCounterVisible.toggle()
      }
    }
  }
}

struct InternalCounter: View {
  @Binding var counter: Int
  var body: some View {
    HStack {
      Button("-") {
        counter -= 1
      }

      Text("\(counter)")

      Button("+") {
        counter += 1
      }
    }
  }
}

#Preview("Simple counter") {
  SimpleCounter()
}

#Preview("Shared counter") {
  SharedStateCounter()
}

// MARK: - Animal List

@_spi(Interaction) public struct Animal/*: Identifiable*/ {
  // public var id: String { name }
  public let name: String
  public let species: String
  public let symbol: String
}

@_spi(Test) extension Animal: Identifiable {
  public var id: String { name }
}

@_spi(Interaction) public class AnimalService: ObservableObject {
  let animals: [Animal] = [
    Animal(name: "Pipoca", species: "Parrot", symbol: "bird"),
    Animal(name: "Turbo", species: "Lizard", symbol: "lizard"),
    Animal(name: "Frajola", species: "Cat", symbol: "cat"),
    Animal(name: "Rex", species: "Dog", symbol: "dog"),
    Animal(name: "Nina", species: "Turtle", symbol: "tortoise"),
    Animal(name: "Bidu", species: "Dog", symbol: "dog"),
    Animal(name: "Chico", species: "Bird", symbol: "bird"),
    Animal(name: "Luna", species: "Ant", symbol: "ant"),
    Animal(name: "Bebel", species: "Ladybug", symbol: "ladybug"),
    Animal(name: "Max", species: "Fish", symbol: "fish"),
  ]

  public init() {}

  public func fetchAnimals() async -> [Animal] {
    try? await Task.sleep(for: .seconds(2))
    return animals
  }
}

@_spi(Interaction) public struct AnimalView: View {
  public init(animal: Animal) {
    self.animal = animal
  }

  let animal: Animal

  public var body: some View {
    VStack(alignment: .leading) {
      Text(animal.name)
        .font(.title)
      HStack {
        Image(systemName: animal.symbol)
        Text(animal.species)
        Spacer()
      }
      .font(.headline)
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(.background)
        .stroke(.gray.opacity(0.2), lineWidth: 2)
    }
  }
}

struct ForEachView: View {

  @EnvironmentObject var service: AnimalService

  @State var animals: [Animal] = []

  var body: some View {
    VStack(alignment: .leading) {
      Text("My animals")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity, alignment: .leading)

      if animals.isEmpty {
        ProgressView()
          .frame(maxWidth: .infinity, alignment: .center)
      } else {
        ForEach(animals) {
          AnimalView(animal: $0)
        }
      }
    }
    .task {
      let fetchedAnimals = await service.fetchAnimals()
      withAnimation {
        animals = fetchedAnimals
      }
    }
  }
}


#Preview("ForEachView") {
  ScrollView {
    ForEachView()
      .padding()
  }
  .environmentObject(AnimalService())
}

// MARK: - Timer List

@Observable
class TimeKeeper: Identifiable {
  var currentTime: Int = 0
  var activeTimer: Timer?
  let id = UUID()
  var state = State.stopped

  func startTimer() {
    guard activeTimer == nil else { return }

    activeTimer = Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true)
    { [weak self] _ in
      withAnimation {
        self?.currentTime += 1
      }
    }

    state = .active
  }

  func pauseTimer() {
    activeTimer?.invalidate()
    activeTimer = nil
    state = .paused
  }

  func stopTimer() {
    pauseTimer()
    currentTime = 0
    state = .stopped
  }

  enum State {
    case active
    case paused
    case stopped
  }
}

public struct TimerApp: View {
  public init() {}

  @State var timers: [TimeKeeper] = []

  public var body: some View {
    Button("Add timer") {
      timers.append(.init())
    }
    navigationLinkTimerList()
  }

  @ViewBuilder @MainActor
  func navigationLinkTimerList() -> some View {
    List($timers) { timekeeper in
      NavigationLink {
        TimerView(timekeeper: timekeeper.wrappedValue)
      } label: {
        TimerRowView(currentTime: timekeeper.currentTime.wrappedValue)
      }
    }
  }

  @State var presentedTimer: TimeKeeper?

  @ViewBuilder @MainActor
  func sheetTimerList() -> some View {
    List($timers) { timekeeper in
      Button {
        presentedTimer = timekeeper.wrappedValue
      } label: {
        TimerRowView(currentTime: timekeeper.currentTime.wrappedValue)
      }
    }
    .sheet(item: $presentedTimer) {
      TimerView(timekeeper: $0)
    }
  }
}

struct TimerRowView: View {
  var currentTime: Int
  var body: some View {
    Text("\(currentTime)")
      .font(.system(.title, design: .monospaced))
      .contentTransition(.numericText(value: Double(currentTime)))
  }
}

struct TimerView: View {
  var timekeeper: TimeKeeper
  @State var shouldStopTimerOnDismiss = false

  var body: some View {
    VStack {
      Text("\(timekeeper.currentTime)")
        .font(.system(size: 140, weight: .regular, design: .monospaced))
        .contentTransition(.numericText(value: Double(timekeeper.currentTime)))
        .timerBackground(state: timekeeper.state)

      HStack {
        Button("Start") {
          timekeeper.startTimer()
        }

        Spacer()

        Button("Pause") {
          timekeeper.pauseTimer()
        }

        Spacer()

        Button("Reset") {
          timekeeper.stopTimer()
        }
      }
      .padding()

      Toggle("Stops timer on dismiss", isOn: $shouldStopTimerOnDismiss)
      .padding()

    }
    .onDisappear {
      if shouldStopTimerOnDismiss {
        timekeeper.stopTimer()
      }
    }
  }
}

extension View {
  func timerBackground(state: TimeKeeper.State) -> some View {
    switch state {
    case .active:
      self
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.green.opacity(0.5))
        }
    case .paused:
      self
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.gray.opacity(0.5))
        }
    case .stopped:
      self
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.red.opacity(0.5))
        }
    }
  }
}

#Preview("Timer") {
  NavigationStack {
    TimerApp()
  }
}
