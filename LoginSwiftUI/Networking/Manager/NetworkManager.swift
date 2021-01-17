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
    
    //Move to its own file if more network calls are added
    func getUsers(completion: @escaping (_ users: [User]?, _ error: String?)->()) {
        router.request(.users) { (data, response, error) in
            if error != nil {
                completion(nil, "Error occured, please check network.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([User].self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}
