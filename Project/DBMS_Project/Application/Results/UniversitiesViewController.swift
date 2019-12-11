//
//  UniversitiesViewController.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 12/10/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

class UniversitiesViewController: UIViewController {
    
    let cellId = "ResultTableViewCell"
    let cellSpacingHeight: CGFloat = 30
    var universitiesList: [University] = []
    var expandedRequest: [Bool] = []
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "back")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backBtnDidTaped), for: .touchUpInside)
        return btn
    }()
    
    lazy var universitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellSpacingHeight
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UniversitiesCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = Constants.mainColor
        cv.dataSource = self
        cv.delegate = self
        cv.isScrollEnabled = true
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func backBtnDidTaped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

///MARK: UICollectionView Delegates
extension UniversitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return universitiesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UniversitiesCollectionViewCell
        cell.university = universitiesList[indexPath.row]
//        cell.ifExpanded = expandedRequest[indexPath.row]
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//            return CGSize(width: view.bounds.width, height: 100)
//        }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = 300
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(kWhateverHeightYouWant))
    }
}


//MARK: ConfigUI and Constraints
extension UniversitiesViewController {
    func configUI() {
        view.backgroundColor = Constants.mainColor
        view.addSubview(universitiesCollectionView)
        view.addSubview(backBtn)
    }
    
    func makeConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        universitiesCollectionView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(backBtn.snp.bottom).offset(30)
        }
    }
}
