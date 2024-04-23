protocol BasicDetailsViewModel {
    var pageTitle: String { get }
    var backButtonTitle: String { get }
    var openDetailsButtonTitle: String { get }

    func backTapped()
    func additionalDetailsTapped()
}
