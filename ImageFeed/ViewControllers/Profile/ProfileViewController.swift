import UIKit
import Kingfisher

protocol ProfileViewControllerProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol { get set }
    var profileImage: UIImageView { get set }
    var surnameLabel: UILabel { get set }
    var emailLabel: UILabel { get set }
    var someTextLabel: UILabel { get set }
    func updateAvatar()
    func configView()
    func makeConstraints()
    func showLogoutAlert()
}

final class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    
    lazy var presenter: ProfilePresenterProtocol = {
        return ProfilePresenter()
    }()
    
    lazy var profileImage = UIImageView()
    lazy var surnameLabel = UILabel()
    lazy var emailLabel = UILabel()
    lazy var someTextLabel = UILabel()
    private lazy var exitButton : UIButton = {
        let exitButton = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
            target: self,
            action: #selector(self.didTapButton))
        return exitButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        configView()
        makeConstraints()
        presenter.view = self
        presenter.viewDidLoad()
        updateAvatar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configView() {
        view.addSubview(profileImage)
        view.addSubview(surnameLabel)
        view.addSubview(emailLabel)
        view.addSubview(someTextLabel)
        view.addSubview(exitButton)
        
        profileImage.image = UIImage(named: "Photo")
        surnameLabel.text = "Екатерина Новикова"
        surnameLabel.font = .systemFont(ofSize: 23, weight: .bold)
        surnameLabel.textColor = .ypWhite
        emailLabel.text = "@ekaterina_nov"
        emailLabel.font = .systemFont(ofSize: 13)
        emailLabel.textColor = .ypGray
        someTextLabel.text = "Hello, world!"
        someTextLabel.font = .systemFont(ofSize: 13)
        someTextLabel.textColor = .ypWhite
        exitButton.setImage(UIImage(named: "ipad.and.arrow.forward"), for: .normal)
        exitButton.tintColor = .ypRed
        
    }
    
    func makeConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        someTextLabel.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            surnameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            surnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            someTextLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            someTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            exitButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26)
        ])
    }
    
    func updateAvatar() {
        guard
            let profileImageURL = ProfileImageService.shared.avatarURL,
            let url = URL(string: profileImageURL)
        else { return }
        let processor = RoundCornerImageProcessor(cornerRadius: 61)
        profileImage.kf.indicatorType = .activity
        profileImage.kf.setImage(with: url,
                                 placeholder: UIImage(named: "person.crop.circle.fill.png"),
                                 options: [.processor(processor),.cacheSerializer(FormatIndicatedCacheSerializer.png)])
        let cache = ImageCache.default
        cache.clearDiskCache()
        cache.clearMemoryCache()
    }
    
    @objc
    private func didTapButton() {
        showLogoutAlert()
    }
    
    func showLogoutAlert() {
        let alert = presenter.makeAlert()
        present(alert, animated: true, completion: nil)
    }
}
