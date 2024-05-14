import Combine

struct DetailsRouter {

    enum Route: Equatable, Hashable {
        case closeJourney
        case back
        case additionalDetails(pageTitle: String)
    }

    var routingPublisher: PassthroughSubject<Route, Never> = .init()

}
