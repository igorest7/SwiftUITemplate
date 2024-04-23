import SwiftUI

protocol MainMenuViewModelFactory {

    func buildMainMenuViewModel(with router: MainMenuRouter) -> ConcreteMainMenuViewModel

}

extension ConcreteViewModelFactory: MainMenuViewModelFactory {

     func buildMainMenuViewModel(with router: MainMenuRouter) -> ConcreteMainMenuViewModel {
        return ConcreteMainMenuViewModel(router: router, todoService: appDependencyProvider.todoService)
    }

}
