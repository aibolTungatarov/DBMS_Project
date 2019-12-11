//
//  ResultTableViewCell.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    var ifExpanded = false
    var viewController = UIViewController()
    let cellId = "professionCollectionView"
    let cellSpacingHeight: CGFloat = 15
    var profession: String = "" {
        didSet {
            professionBtn.setTitle(profession, for: .normal)
        }
    }
    var specialities: [Speciality] = []
    var professionBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.rgbColor(r: 47, g: 49, b: 72, alpha: 1)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    lazy var professionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellSpacingHeight
//        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProfessionCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = Constants.mainColor
        cv.dataSource = self
        cv.delegate = self
        cv.isScrollEnabled = true
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.mainColor
        configUI()
        makeConstraints()
    }
    
    @objc func professionDidSelected() {
        ifExpanded = !ifExpanded
        if ifExpanded {
            professionCollectionView.snp.remakeConstraints { (make) in
                make.left.right.equalTo(professionBtn)
                make.bottom.equalToSuperview()
                make.top.equalTo(professionBtn.snp.bottom)
            }
        } else {
            professionCollectionView.snp.remakeConstraints { (make) in
                make.top.bottom.equalTo(professionBtn.snp.bottom)
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }
}


extension ResultCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specialities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        as! ProfessionCollectionViewCell
        cell.speciality = specialities[indexPath.row]
//        cell.result = resultsList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let universitiesVC = UniversitiesViewController()
        universitiesVC.universitiesList = specialities[indexPath.row].universities
        print("AIBOL", specialities[indexPath.row].universities.count)
        viewController.navigationController?.pushViewController(universitiesVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = 40
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(kWhateverHeightYouWant))
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 1, height: 10)
    }
}

//MARK: ConfigUI and Constraints
extension ResultCollectionViewCell {
    func configUI() {
        addSubview(professionCollectionView)
        professionBtn.addTarget(self, action: #selector(professionDidSelected), for: .touchUpInside)
        addSubview(professionBtn)
    }
    
    func makeConstraints() {
        professionBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        professionCollectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(professionBtn.snp.bottom)
        }
    }
}
