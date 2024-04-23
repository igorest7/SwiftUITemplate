import Combine
import SwiftUI

@Observable final class ConcreteMainMenuViewModel: MainMenuViewModel {

    private(set) var dataText = Localizable.mainMenuDataTextNotLoaded
    private(set) var pageTitle = Localizable.mainMenuTitle
    private(set) var openDetailsButtonTitle = Localizable.mainMenuDetailsButtonTitle
    private(set) var openSheetButtonTitle = Localizable.mainMenuSheetButtonTitle
    private(set) var refreshDetailsButtonTitle = Localizable.mainMenuRefreshButtonTitle
    private(set) var openURLButtonTitle = Localizable.mainMenuOpenURLButtonTitle
    private(set) var error: ViewStateError?

    private let router: MainMenuRouter
    private let todoService: TodoService

    private var todos = [Todo]()

    init(router: MainMenuRouter, todoService: TodoService) {
        self.router = router
        self.todoService = todoService
    }

    func openDetailsTapped() {
        router.routingPublisher.send(.details(detailsTitle: dataText))
    }

    func refreshTapped() {
        dataText = Localizable.mainMenuDataTextLoading

        todoService.fetchTodos()
            .subscribe(
                Subscribers.Sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        self?.error = error.asViewStateError
                    },
                    receiveValue: (
                        { [weak self] todos in
                            guard let self = self else { return }
                            self.todos = todos
                            guard let todo = todos.first else {
                                self.dataText = Localizable.mainMenuDataTextEmpty
                                return
                            }
                            self.dataText = Localizable.mainMenuDataTextPrefix + todo.title
                        }
                    )
                )
            )
    }

    func openSheetTapped() {
        router.routingPublisher.send(
            .sheet(item: .init(title: todos.first?.title ?? Localizable.mainMenuDataTextNotLoaded))
        )
    }
}
