import Foundation

@Observable final class ConcreteBasicDetailsViewModel: BasicDetailsViewModel {

    private(set) var pageTitle: String
    private(set) var backButtonTitle: String = Localizable.backButtonTitle
    private(set) var openDetailsButtonTitle: String = Localizable.openAdditionalDetailsButtonTitle

    private let router: DetailsRouter

    init(router: DetailsRouter, pageTitle: String) {
        self.router = router
        self.pageTitle = pageTitle
    }

    func backTapped() {
        router.routingPublisher.send(.back)
    }

    func additionalDetailsTapped() {
        router.routingPublisher.send(.additionalDetails(pageTitle: Localizable.additionalDetailsTitle))
    }

}
