import Foundation

@Observable final class ConcreteAdditionalDetailsViewModel: AdditionalDetailsViewModel {

    private(set) var pageTitle: String = Localizable.additionalDetailsTitle
    private(set) var mainMenuButtonTitle: String = Localizable.openMainMenuButtonTitle
    
    private let router: DetailsRouter

    init(router: DetailsRouter) {
        self.router = router
    }

    func mainMenuTapped() {
        router.routingPublisher.send(.closeJourney)
    }

}
