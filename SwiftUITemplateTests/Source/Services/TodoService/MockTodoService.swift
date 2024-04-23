import Combine
@testable import SwiftUITemplate

class MockTodoService: TodoService {

    var fetchDataPublisher: PassthroughSubject<[Todo], TodoServiceError> = .init()

    func fetchTodos() -> AnyPublisher<[Todo], TodoServiceError> {
        print("fetched todos")
        return fetchDataPublisher.eraseToAnyPublisher()
    }
}
