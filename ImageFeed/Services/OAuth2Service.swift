import Foundation

final class OAuth2Service {
    
    static private let shared = OAuth2Service()
    private let urlSession = URLSession.shared
    private let tokenStorage = OAuth2TokenStorage.shared
    private var task: URLSessionTask?
    private var lastCode: String?
    
    private (set) var authToken: String? {
        get {
            return tokenStorage.token
        }
        set {
            tokenStorage.token = newValue
        } }
    
    func fetchOAuthToken(
        _ code: String,
        completion: @escaping (Result<String, Error>) -> Void ){
            assert(Thread.isMainThread)
            if lastCode == code { return }
            task?.cancel()
            lastCode = code
            let request = authTokenRequest(code: code)
            let session = urlSession
            let task = session.objectTask(for: request) { [weak self] (result: Result<OAuthTokenResponseBody, Error>) in
                   switch result {
                   case .success(let decodedObject):
                       completion(.success(decodedObject.accessToken))
                       self?.task = nil
                   case .failure(let error):
                       completion(.failure(error))
                   }
               }
               self.task = task
               task.resume()
           }
    
    private func authTokenRequest(code: String) -> URLRequest {
        URLRequest.makeHTTPRequest(
            path: "/oauth/token"
            + "?client_id=\(Constants.accessKey)"
            + "&&client_secret=\(Constants.secretKey)"
            + "&&redirect_uri=\(Constants.redirectURI)"
            + "&&code=\(code)"
            + "&&grant_type=authorization_code",
            httpMethod: "POST",
            baseURL: URL(string: "https://unsplash.com")!
        ) }
    
    private func makeRequest(code: String) -> URLRequest {
           guard let url = URL(string: "...\(code)") else { fatalError("Failed to create URL") }
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           return request
       }
    
    private struct OAuthTokenResponseBody: Decodable {
        let accessToken: String
        let tokenType: String
        let scope: String
        let createdAt: Int
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case scope
            case createdAt = "created_at"
        }
    }
}

extension URLRequest {
    static func makeHTTPRequest(
        path: String,
        httpMethod: String,
        baseURL: URL = Constants.defaultBaseURl
    ) -> URLRequest {
        var request = URLRequest(url: URL(string: path, relativeTo: baseURL)!)
        request.httpMethod = httpMethod
        return request
    } }

// MARK: - Network Connection
private enum NetworkError: Error {
        case codeError
    }
