import Foundation

@Observable final class ConcreteAdditionalDetailsViewModel: AdditionalDetailsViewModel {

    let pageTitle: String
    private(set) var mainMenuButtonTitle: String = Localizable.openMainMenuButtonTitle
    
    private let router: DetailsRouter

    init(router: DetailsRouter, pageTitle: String) {
        self.router = router
        self.pageTitle = pageTitle
    }

    func mainMenuTapped() {
        router.routingPublisher.send(.closeJourney)
    }

}
