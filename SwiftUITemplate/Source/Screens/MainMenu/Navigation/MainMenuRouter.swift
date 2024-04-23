import Combine

struct MainMenuRouter {

    enum Route: Hashable {
        case details(detailsTitle: String)
        case sheet(item: MainMenuSheetItem)
    }

    var routingPublisher: PassthroughSubject<Route, Never> = .init()

}
