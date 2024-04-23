import SwiftUI

struct DeeplinkCoordinator: View {

    enum Route: Hashable {
        case details(detailsTitle: String)
    }

    @State private var navigationPath = NavigationPath()
    
    private let viewModelFactory: ViewModelFactory

    init(viewModelFactory: ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            MainMenuCoordinator(navigationPath: $navigationPath, viewModelFactory: viewModelFactory)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .details(let detailsTitle): detailsDestination(detailsTitle: detailsTitle)
                    }
                }
        }
        .onOpenURL { url in
            openDeeplingURL(url)
        }
    }

    private func detailsDestination(detailsTitle: String) -> some View {
        DetailsCoordinator(
            navigationPath: $navigationPath, viewModelFactory: viewModelFactory, basicDetailsPageTitle: detailsTitle
        )
        .navigationBarBackButtonHidden(true)
    }

    private func openDeeplingURL(_ url: URL) {
        guard url.scheme == "details",
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              components.host == "openDetails",
              let detailsTitle = components.queryItems?.first(where: { $0.name == "title" })?.value
        else {
            return
        }

        navigationPath.append(Route.details(detailsTitle: detailsTitle))
    }
}
