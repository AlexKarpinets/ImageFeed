import Foundation

let AccessKey = "UWHoiK56oeXkMMFakelxYjtr9SXBJac9RTSwG-K-rTc"
let SecretKey = "c0jHT2QfQFZt-elMrx5JYbzcKO4LwCSZ4thWcvepqoo"
let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
let AccessScope = "public+read_user+write_likes"

let DefaultBaseURl = URL(string: "https://api.unsplash.com")!
let UnsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"

struct AuthConfiguration {
    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let defaultBaseURL: URL
    let authURLString: String
    
    init(accessKey: String, secretKey: String, redirectURI: String, accessScope: String, authURLString: String, defaultBaseURL: URL) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.redirectURI = redirectURI
        self.accessScope = accessScope
        self.defaultBaseURL = defaultBaseURL
        self.authURLString = authURLString
    }
    
    static var standard: AuthConfiguration {
        AuthConfiguration(accessKey: AccessKey,
                          secretKey: SecretKey,
                          redirectURI: RedirectURI,
                          accessScope: AccessScope,
                          authURLString: UnsplashAuthorizeURLString,
                          defaultBaseURL: DefaultBaseURl)
    }
}
