import UIKit

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    static let reuseIdentifier = "ImagesListCell"
}
