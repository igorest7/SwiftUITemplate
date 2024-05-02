import Foundation
import Combine
@testable import SwiftUITemplate

class MockDataPublisherProvider: DataPublisherProvider {

    var mockDataPublisher: PassthroughSubject<DataPublisherResponse, URLError> = .init()

    func dataPublisher(for url: URL) -> AnyPublisher<DataPublisherResponse, URLError> {
        mockDataPublisher.eraseToAnyPublisher()
    }

}
