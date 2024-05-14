protocol AdditionalDetailsViewModelFactory {

    func buildAdditionalDetailsViewModel(
        with router: DetailsRouter, pageTitle: String
    ) -> ConcreteAdditionalDetailsViewModel

}

extension ConcreteViewModelFactory: AdditionalDetailsViewModelFactory {

    func buildAdditionalDetailsViewModel(
        with router: DetailsRouter, pageTitle: String
    ) -> ConcreteAdditionalDetailsViewModel {
        ConcreteAdditionalDetailsViewModel(router: router, pageTitle: pageTitle)
    }

}
