import SwiftUI

struct DetailsCoordinator: View {

    @Binding private var navigationPath: NavigationPath
    @State private var viewsCount = 1
    private let router = DetailsRouter()

    private let viewModelFactory: ViewModelFactory
    private let basicDetailsPageTitle: String

    init(navigationPath: Binding<NavigationPath>, viewModelFactory: ViewModelFactory, basicDetailsPageTitle: String) {
        self._navigationPath = navigationPath
        self.viewModelFactory = viewModelFactory
        self.basicDetailsPageTitle = basicDetailsPageTitle
    }

    var body: some View {
        BasicDetailsView(
            viewModel: viewModelFactory.buildBasicDetailsViewModel(with: router, pageTitle: basicDetailsPageTitle)
        )
        .navigationDestination(for: DetailsRouter.Route.self) { route in
            switch route {
            case .additionalDetails(let pageTitle): additionalDetailsDestination(pageTitle: pageTitle)
            case .back, .closeJourney:
                EmptyView()
            }
        }
        .onReceive(router.routingPublisher) { route in
            if route == .closeJourney {
                navigationPath.removeLast(viewsCount)
            } else if route == .back {
                navigationPath.removeLast()
                viewsCount -= 1
            } else {
                navigationPath.append(route)
                viewsCount += 1
            }
        }
    }

    private func additionalDetailsDestination(pageTitle: String) -> some View {
        AdditionalDetailsView(
            viewModel: viewModelFactory.buildAdditionalDetailsViewModel(
                with: router, pageTitle: pageTitle
            )
        )
        .navigationBarBackButtonHidden(true)
    }
}
