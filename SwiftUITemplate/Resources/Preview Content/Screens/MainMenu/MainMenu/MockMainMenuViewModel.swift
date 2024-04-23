struct MockMainMenuViewModel: MainMenuViewModel {

    var dataText: String
    var pageTitle: String
    var openDetailsButtonTitle: String
    var openSheetButtonTitle: String
    var refreshDetailsButtonTitle: String
    var openURLButtonTitle: String
    var error: ViewStateError?

    func openDetailsTapped() {}

    func refreshTapped() {}

    func openSheetTapped() {}

}
