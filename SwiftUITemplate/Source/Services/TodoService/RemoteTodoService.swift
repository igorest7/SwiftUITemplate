import Foundation
import Combine

class RemoteTodoService: TodoService {

    private let baseURL: URL
    private let dataPublisherProvider: DataPublisherProvider

    init(baseURL: URL, dataPublisherProvider: DataPublisherProvider) {
        self.baseURL = baseURL
        self.dataPublisherProvider = dataPublisherProvider
    }

    func fetchTodos() -> AnyPublisher<[Todo], TodoServiceError> {
        dataPublisherProvider.dataPublisher(for: baseURL)
                    .map(\.data)
                    .decode(type: [Todo].self, decoder: JSONDecoder())
                    .mapError { _ in
                        TodoServiceError.requestFailed
                    }
                    .eraseToAnyPublisher()
    }
}
