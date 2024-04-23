class MockMainMenuViewModelBuilder {
    var dataText = ""
    var pageTitle = ""
    var openDetailsButtonTitle = ""
    var openSheetButtonTitle = ""
    var refreshDetailsButtonTitle = ""
    var openURLButtonTitle = ""
    var error: ViewStateError?

    fileprivate func build() -> MockMainMenuViewModel {
        MockMainMenuViewModel(
            dataText: dataText,
            pageTitle: pageTitle,
            openDetailsButtonTitle: openDetailsButtonTitle,
            openSheetButtonTitle: openSheetButtonTitle,
            refreshDetailsButtonTitle: refreshDetailsButtonTitle,
            openURLButtonTitle: openURLButtonTitle,
            error: error
        )
    }
}

extension MockMainMenuViewModel {
    static func build(_ build: ((MockMainMenuViewModelBuilder) -> Void)? = nil) -> MockMainMenuViewModel {
        let builder = MockMainMenuViewModelBuilder()
        build?(builder)
        return builder.build()
    }
}
