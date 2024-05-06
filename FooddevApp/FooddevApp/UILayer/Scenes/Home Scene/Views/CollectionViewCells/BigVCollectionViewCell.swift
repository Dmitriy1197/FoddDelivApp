//
//  BigVCollectionViewCell.swift
//  FooddevApp
//
//  Created by Dima on 06.05.2024.
//

import UIKit

class BigVCollectionViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let titlelabel = UILabel()
    
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
            topView.heightAnchor.constraint(equalToConstant: 130),
            topView.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    func setupBottomLabel(){
        contentView.addSubview(titlelabel)
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.textAlignment = .center
        titlelabel.font = .Roboto.regular.size(of: 14)
        titlelabel.text = "Title"
        titlelabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            titlelabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15)
        ])
    }
}


