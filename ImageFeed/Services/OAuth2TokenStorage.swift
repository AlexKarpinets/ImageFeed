import Foundation

final class OAuth2TokenStorage {
    
    private let userDefaults = UserDefaults.standard
    static let shared = OAuth2TokenStorage()
    
    var token: String? {
        get {
            return userDefaults.string(forKey: "token")
        }
        set {
            return userDefaults.set(newValue, forKey: "token")
        }
    }
}
