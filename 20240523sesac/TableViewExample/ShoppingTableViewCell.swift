//
//  ShoppingTableViewCell.swift
//  20240523sesac
//
//  Created by 장예지 on 5/23/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier: String = "ShoppingTableViewCell"
    
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUI(){
        cellBackgroundView.backgroundColor = .systemGray6
        cellBackgroundView.layer.cornerRadius = 12
        
        checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        checkButton.tintColor = .black
        
        likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        likeButton.tintColor = .black
        
        titleLabel.font = .systemFont(ofSize: 12)
    }
    
    public func setShoppingList(content: ShoppingList){
        checkButton.setImage(content.isChecked ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square"), for: .normal)
        likeButton.setImage(content.isLiked ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
        titleLabel.text = content.title
        
    }
}
