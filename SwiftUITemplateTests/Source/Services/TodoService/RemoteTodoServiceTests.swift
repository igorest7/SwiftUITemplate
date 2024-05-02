import Combine
@testable import SwiftUITemplate
import XCTest

class RemoteTodoServiceTests: XCTestCase {

    var dataPublisher: MockDataPublisherProvider!
    var todoService: RemoteTodoService!

    override func setUp() {
        dataPublisher = MockDataPublisherProvider()
        todoService = RemoteTodoService(baseURL: URL(filePath: ""), dataPublisherProvider: dataPublisher)
    }

    func test_fetchTodos_whenDataPublisherReturnsError_PublishesRequestFailed() {
        var completion: Subscribers.Completion<TodoServiceError>?
        todoService.fetchTodos()
            .subscribe(Subscribers.Sink(receiveCompletion: { completion = $0 }, receiveValue: ({ _ in })))

        dataPublisher.mockDataPublisher.send(completion: .failure(.init(.badURL)))
        guard .failure(.requestFailed) == completion else {
            XCTFail()
            return
        }
    }

    func test_fetchTodos_whenDataPublisherReturnsTodos_PublishesTodos() {
        var todos = [Todo]()
        todoService.fetchTodos()
            .subscribe(Subscribers.Sink(receiveCompletion: { _ in }, receiveValue: ({ todos.append(contentsOf: $0) })))

        guard let data = try? JSONEncoder().encode([Todo.build()]) else {
            XCTFail()
            return
        }
        dataPublisher.mockDataPublisher.send((data: data, response: .init()))
        XCTAssertFalse(todos.isEmpty)
    }
}
