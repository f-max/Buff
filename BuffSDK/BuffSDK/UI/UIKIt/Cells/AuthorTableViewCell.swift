//
//  AuthorTableViewCell.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewAuthorHolder: UIView!
    @IBOutlet weak var imageViewAuthor: UIImageView!
    @IBOutlet weak var labelFullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let imageView = imageView {
            imageView.layer.cornerRadius = imageView.bounds.height/2
        }
        if let viewAuthorHolder = viewAuthorHolder {
            viewAuthorHolder.layer.cornerRadius = viewAuthorHolder.bounds.height/2
        }
    }
    
    var author: Author? {
        didSet {
            if let author = author {
                configure(author: author)
            }
        }
    }
    
    private func configure(author: Author) {
        labelFullName.text = author.fullName
        loadAuthorImage()
    }
    
    private func loadAuthorImage() {
        if let data = author?.imageData, let image = UIImage(data: data) {
            imageViewAuthor.image = image
        }
    }
}
