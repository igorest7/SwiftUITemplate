final class ConcreteViewModelFactory: ViewModelFactory {

    let appDependencyProvider: AppDependencyProvider

    init(appDependencyProvider: AppDependencyProvider) {
        self.appDependencyProvider = appDependencyProvider
    }

}
