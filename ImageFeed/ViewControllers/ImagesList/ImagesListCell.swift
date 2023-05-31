import UIKit

protocol ImagesListCellDelegate: AnyObject {
    func imageListCellDidTapLike(_ cell: ImagesListCell)
}

final class ImagesListCell: UITableViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    static let reuseIdentifier = "ImagesListCell"
    weak var delegate: ImagesListCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        images.kf.cancelDownloadTask()
    }
    
    func setIsLiked(isLiked: Bool) {
        let likeImage = isLiked ? UIImage(named: "Active") : UIImage(named: "No Active")
        favoriteButton.imageView?.image = likeImage
        favoriteButton.setImage(likeImage, for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.imageListCellDidTapLike(self)
    }
    
}
