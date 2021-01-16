import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    private let router = Router<UsersApi>()
    
    
    public enum NetworkResponse: String {
        case success
        case authenticationError = "Authentication error, you need to authenticate."
        case badRequest = "Bad request"
        case outdated = "The requested url is outdated."
        case failed = "Network request failed."
        case noData = "Response returned with no data to decode."
        case unableToDecode = "Unable to decode response."
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
