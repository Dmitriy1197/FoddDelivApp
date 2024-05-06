//
//  HomeViewController.swift
//  FooddevApp
//
//  Created by Dima on 28.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var smallHCollection: UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 0
      
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()
    
    lazy var bigHCollection: UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
       
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    
    lazy var bigVCollection: UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 3
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}


//MARK: - Layout
extension HomeViewController{
    func setupLayout(){
        setupView()
        setupSmallHCollection()
        setupBigHCollection()
        setupBigVCollection()
    }
    func setupView(){
        view.backgroundColor = AppColors.white

    }
    func setupSmallHCollection(){
        view.addSubview(smallHCollection)
        smallHCollection.backgroundColor = AppColors.white
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCollectionViewCell.self, forCellWithReuseIdentifier: "SmallHCollectionViewCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            smallHCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            smallHCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            smallHCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    func setupBigHCollection(){
        view.addSubview(bigHCollection)
        bigHCollection.backgroundColor = AppColors.white
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHCollectionViewCell.self, forCellWithReuseIdentifier: "BigHCollectionViewCell")
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 77
                                               ),
            bigHCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bigHCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bigHCollection.heightAnchor.constraint(equalToConstant: 130 * 2 + 20)
        ])
    }
    func setupBigVCollection(){
        view.addSubview(bigVCollection)
        bigVCollection.backgroundColor = AppColors.white
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigVCollectionViewCell.self, forCellWithReuseIdentifier: "BigVCollectionViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 77
                                               ),
            bigVCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bigVCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bigVCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


//MARK: - CollectionView delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
        case 1: 20
        case 2: 20
        case 3: 20
        default: 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCollectionViewCell", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCollectionViewCell", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCollectionViewCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
       
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag{
        case 1:
            return CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            let heigth = 130.0
            return CGSize(width: width, height: heigth)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

#Preview("HomeVC"){
    HomeViewController()
}
