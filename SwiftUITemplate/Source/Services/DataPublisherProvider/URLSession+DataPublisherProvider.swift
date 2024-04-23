import Foundation
import Combine

extension URLSession: DataPublisherProvider {

    func dataPublisher(for url: URL) -> AnyPublisher<DataPublisherResponse, URLError> {
        dataTaskPublisher(for: url).eraseToAnyPublisher()
    }

}
