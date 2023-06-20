@testable import ImageFeed
import UIKit

final class ProfileViewControllerSpy: ProfileViewControllerProtocol {

    var presenter: ImageFeed.ProfilePresenterProtocol
    
    init (presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
    }
    
    var profileImage: UIImageView = UIImageView()
    var surnameLabel: UILabel = UILabel()
    var emailLabel: UILabel = UILabel()
    var someTextLabel: UILabel = UILabel()
    var update: Bool = false
    var views: Bool = false
    var constraints: Bool = false
    var alert: Bool = false
    
    func updateAvatar() {
        update = true
    }
    
    func configView() {
        views = true
    }
    
    func makeConstraints() {
        constraints = true
    }
    
    func showAlert() {
        presenter.logout()
    }
    
    func showLogoutAlert() {
        alert = true
    }
}
