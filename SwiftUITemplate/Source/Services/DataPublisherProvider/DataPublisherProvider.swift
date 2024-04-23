import Foundation
import Combine

protocol DataPublisherProvider {
    typealias DataPublisherResponse = URLSession.DataTaskPublisher.Output

    func dataPublisher(for url: URL) -> AnyPublisher<DataPublisherResponse, URLError>
}
