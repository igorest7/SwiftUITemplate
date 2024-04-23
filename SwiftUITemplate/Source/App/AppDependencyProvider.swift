import Foundation

final class AppDependencyProvider {
    lazy var todoService: TodoService = {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos") ?? URL(fileURLWithPath: "")
        return RemoteTodoService(baseURL: url, dataPublisherProvider: URLSession.shared)
    }()
}
