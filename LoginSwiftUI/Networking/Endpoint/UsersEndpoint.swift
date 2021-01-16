import Foundation

//Can be extended for more endpoints
public enum UsersApi {
    case users
}

extension UsersApi: EndpointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production, .qa, .staging:
            return " https://jsonplaceholder.typicode.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("BaseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
    var httpMethod: HttpMethod {
        return.get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}

