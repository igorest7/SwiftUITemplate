import Combine

protocol TodoService {
    func fetchTodos() -> AnyPublisher<[Todo], TodoServiceError>
}
