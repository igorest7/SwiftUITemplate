class MockBasicDetailsViewModelBuilder {
    var pageTitle = ""
    var backButtonTitle = ""
    var openDetailsButtonTitle = ""

    fileprivate func build() -> MockBasicDetailsViewModel {
        MockBasicDetailsViewModel(
            pageTitle: pageTitle,
            backButtonTitle: backButtonTitle,
            openDetailsButtonTitle: openDetailsButtonTitle
        )
    }
}

extension MockBasicDetailsViewModel {
    static func build(_ build: ((MockBasicDetailsViewModelBuilder) -> Void)? = nil) -> MockBasicDetailsViewModel {
        let builder = MockBasicDetailsViewModelBuilder()
        build?(builder)
        return builder.build()
    }
}
