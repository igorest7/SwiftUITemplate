protocol BasicDetailsViewModelFactory {

    func buildBasicDetailsViewModel(with router: DetailsRouter, pageTitle: String) -> ConcreteBasicDetailsViewModel

}

extension ConcreteViewModelFactory: BasicDetailsViewModelFactory {

    func buildBasicDetailsViewModel(with router: DetailsRouter, pageTitle: String) -> ConcreteBasicDetailsViewModel {
        ConcreteBasicDetailsViewModel(router: router, pageTitle: pageTitle)
    }

}
