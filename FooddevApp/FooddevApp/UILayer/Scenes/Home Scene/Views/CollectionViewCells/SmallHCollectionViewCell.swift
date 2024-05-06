//
//  SmallHCollectionViewCell.swift
//  FooddevApp
//
//  Created by Dima on 28.04.2024.
//

import UIKit

class SmallHCollectionViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
        contentView.backgroundColor = AppColors.white
        setupTopView()
        setupBottomLabel()
    }
    func setupTopView(){
        contentView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = AppColors.grey
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.heightAnchor.constraint(equalToConstant: 70),
            topView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    func setupBottomLabel(){
        contentView.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.textAlignment = .center
        bottomLabel.font = .Roboto.regular.size(of: 14)
        bottomLabel.text = "Text"
        bottomLabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
