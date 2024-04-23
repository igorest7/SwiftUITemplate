import SwiftUI

struct MainMenuCoordinator: View {

    @Binding private var navigationPath: NavigationPath
    @State private var sheetItem: MainMenuSheetItem?

    private let router = MainMenuRouter()

    private let viewModelFactory: ViewModelFactory

    init(navigationPath: Binding<NavigationPath>, viewModelFactory: ViewModelFactory) {
        self._navigationPath = navigationPath
        self.viewModelFactory = viewModelFactory
    }

    var body: some View {
        MainMenuView(viewModel: viewModelFactory.buildMainMenuViewModel(with: router))
            .sheet(item: $sheetItem, content: sheetDestination)
            .navigationDestination(for: MainMenuRouter.Route.self) { route in
                switch route {
                case .details(let detailsTitle): detailsDestination(detailsTitle: detailsTitle)
                case .sheet: EmptyView()
                }
            }
            .onReceive(router.routingPublisher) { route in
                switch route {
                case .details:
                    navigationPath.append(route)
                case .sheet(let item):
                    sheetItem = item
                }
            }
    }

    private func detailsDestination(detailsTitle: String) -> some View {
        DetailsCoordinator(
            navigationPath: $navigationPath, viewModelFactory: viewModelFactory, basicDetailsPageTitle: detailsTitle
        )
        .navigationBarBackButtonHidden(true)
    }

    private func sheetDestination(sheetItem: MainMenuSheetItem) -> some View {
        MainMenuSheetView(sheetItem: sheetItem)
    }
}
