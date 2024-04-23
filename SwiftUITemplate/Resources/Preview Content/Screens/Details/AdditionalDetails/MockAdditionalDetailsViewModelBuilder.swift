class MockAdditionalDetailsViewModelBuilder {
    var pageTitle = ""
    var mainMenuButtonTitle = ""

    fileprivate func build() -> MockAdditionalDetailsViewModel {
        MockAdditionalDetailsViewModel(pageTitle: pageTitle, mainMenuButtonTitle: mainMenuButtonTitle)
    }
}

extension MockAdditionalDetailsViewModel {
    static func build(_ build: ((MockAdditionalDetailsViewModelBuilder) -> Void)? = nil) -> MockAdditionalDetailsViewModel {
        let builder = MockAdditionalDetailsViewModelBuilder()
        build?(builder)
        return builder.build()
    }
}
