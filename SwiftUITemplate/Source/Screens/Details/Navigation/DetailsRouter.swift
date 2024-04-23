import Combine

struct DetailsRouter {

    enum Route: Equatable {
        case closeJourney
        case back
        case additionalDetails
    }

    var routingPublisher: PassthroughSubject<Route, Never> = .init()

}
