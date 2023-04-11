import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileImage = UIImageView()
    private let surname = UILabel()
    private let email = UILabel()
    private let someText = UILabel()
    private let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        configView()
        makeConstraints()
    }
    
    private func configView() {
        view.addSubview(profileImage)
        view.addSubview(surname)
        view.addSubview(email)
        view.addSubview(someText)
        view.addSubview(exitButton)
        
        profileImage.image = UIImage(named: "Photo")
        surname.text = "Екатерина Новикова"
        surname.font = surname.font.withSize(23)
        surname.textColor = .ypWhite
        email.text = "@ekaterina_nov"
        email.textColor = .ypGray
        someText.text = "Hello, world!"
        someText.textColor = .ypWhite
        exitButton.setImage(UIImage(named: "ipad.and.arrow.forward"), for: .normal)
        exitButton.tintColor = .ypRed
        
    }
    
    private func makeConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        surname.translatesAutoresizingMaskIntoConstraints = false
        email.translatesAutoresizingMaskIntoConstraints = false
        someText.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            surname.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            surname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            email.topAnchor.constraint(equalTo: surname.bottomAnchor, constant: 8),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            someText.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8),
            someText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            exitButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26)
        ])
    }
}
