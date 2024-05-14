protocol MainMenuViewModelFactory {

    func buildMainMenuViewModel(with router: MainMenuRouter) -> ConcreteMainMenuViewModel

}

extension ConcreteViewModelFactory: MainMenuViewModelFactory {

     func buildMainMenuViewModel(with router: MainMenuRouter) -> ConcreteMainMenuViewModel {
        ConcreteMainMenuViewModel(router: router, todoService: appDependencyProvider.todoService)
    }

}
