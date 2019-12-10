//
//  UniversitiesCollectionViewCell.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 12/11/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

class UniversitiesCollectionViewCell: UICollectionViewCell {
    var ifExpanded = false
    var university: University = University(name: "DD", site: "dwq", code: 213, city: "ewf", grant_total: 213, grant_rus: 32, grant_kaz: 32) {
        didSet {
            universityCodeLabel.text = String(university.code)
            universityNameLabel.text = university.name
            cityNameLabel.text = university.city
        }
    }
    var universities: [University] = []
    lazy var universityCodeLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "5B110300"
        return lbl
    }()
    lazy var universityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Фармация"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 26)
        return lbl
    }()
//    lazy var profSeparationView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
//        return view
//    }()
//    lazy var universityNameTitleLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "University"
//        lbl.font = UIFont.boldSystemFont(ofSize: 14)
//        lbl.numberOfLines = 0
//        lbl.textColor = Constants.mainColor
//        return lbl
//    }()
//    lazy var universityNameLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "Казахский национальный медицинский университет имени С. Д. Асфендиярова (КазНМУ)"
//        lbl.preferredMaxLayoutWidth = CGFloat(UIScreen.main.bounds.width - 40)
//        lbl.numberOfLines = 0
//        return lbl
//    }()
    lazy var univSeparationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
    lazy var cityNameTitleLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "City"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = Constants.mainColor
        return lbl
    }()
    lazy var cityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Pavlodar"
        lbl.preferredMaxLayoutWidth = CGFloat(UIScreen.main.bounds.width - 40)
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var citySeparationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
//    lazy var moreInfoSeparionView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
//        return view
//    }()
//    lazy var moreInfoBtn: UIButton = {
//        let btn = UIButton()
//        btn.backgroundColor = Constants.mainColor
//        btn.setTitle("More Info", for: .normal)
//        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        btn.layer.cornerRadius = 5
//        btn.clipsToBounds = true
//        btn.semanticContentAttribute = .forceRightToLeft
//        btn.addTarget(self, action: #selector(moreInfoDidTaped), for: .touchUpInside)
//        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5)
//        return btn
//    }()
//    lazy var grantBottomHorizontalView = UIView()
//    lazy var contentVerticalStackView = UIStackView()
//    lazy var totalGrantTitleLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "Total grants"
//        lbl.font = UIFont.boldSystemFont(ofSize: 14)
//        lbl.numberOfLines = 0
//        lbl.textColor = Constants.mainColor
//        return lbl
//    }()
//    lazy var totalGrantLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "1000"
//        lbl.numberOfLines = 0
//        return lbl
//    }()
//    lazy var grantOneSeparionView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
//        return view
//    }()
//    lazy var grantScoreTitleLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "Avg Score"
//        lbl.font = UIFont.boldSystemFont(ofSize: 14)
//        lbl.numberOfLines = 0
//        lbl.textColor = Constants.mainColor
//        return lbl
//    }()
//    lazy var grantScoreLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "90"
//        lbl.numberOfLines = 0
//        return lbl
//    }()
//    lazy var grantSeparionView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
//        return view
//    }()
//    lazy var siteTitleLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "Site"
//        lbl.font = UIFont.boldSystemFont(ofSize: 14)
//        lbl.numberOfLines = 0
//        lbl.textColor = Constants.mainColor
//        return lbl
//    }()
//    lazy var siteTextView: UITextView = {
//        var tv = UITextView()
//        tv.text = "http://sirdariya.kz"
//        tv.font = UIFont.systemFont(ofSize: 18)
//        tv.isEditable = false
//        tv.dataDetectorTypes = UIDataDetectorTypes.all
//        return tv
//    }()
//    lazy var siteSeparationView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
//        return view
//    }()
//    lazy var examScoreLabel: UILabel = {
//        var lbl = UILabel()
//        lbl.text = "99"
//        return lbl
//    }()
//    lazy var moreContent = [totalGrantTitleLabel, totalGrantLabel, grantOneSeparionView, grantScoreTitleLabel, grantScoreLabel, grantSeparionView, cityNameTitleLabel, cityNameLabel, citySeparationView, siteTitleLabel, siteTextView, siteSeparationView]

    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 2.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        makeConstraints()
    }
}


// MARK: ConfigUI and Constraints
extension UniversitiesCollectionViewCell {
    func configUI() {
        //        for content in moreContent {
        //            content.isHidden = true
        //        }
        backgroundColor = .white
        addSubview(universityCodeLabel)
        addSubview(universityNameLabel)
//        addSubview(profSeparationView)
//        addSubview(universityNameTitleLabel)
        addSubview(univSeparationView)
//        addSubview(firstSubjectTitleLabel)
//        addSubview(firstSubjectLabel)
//        addSubview(secondSubjectSeparionView)
//        addSubview(secondSubjectTitleLabel)
//        addSubview(secondSubjectLabel)
//        addSubview(moreInfoSeparionView)
//        addSubview(moreInfoBtn)
//        addSubview(examScoreLabel)
//        addSubview(totalGrantTitleLabel)
//        addSubview(totalGrantLabel)
//        addSubview(grantOneSeparionView)
//        addSubview(grantSeparionView)
//        addSubview(grantScoreTitleLabel)
//        addSubview(grantScoreLabel)
        addSubview(cityNameTitleLabel)
        addSubview(cityNameLabel)
        addSubview(citySeparationView)
//        addSubview(siteTitleLabel)
//        addSubview(siteTextView)
//        addSubview(siteSeparationView)
        
    }
    
    func makeConstraints() {
        universityCodeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        universityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(universityCodeLabel.snp.bottom).offset(2)
            make.left.right.equalTo(universityCodeLabel)
        }
//        profSeparationView.snp.makeConstraints { (make) in
//            make.top.equalTo(universityNameLabel.snp.bottom).offset(10)
//            make.height.equalTo(1)
//            make.left.right.equalToSuperview()
//        }
//        universityNameTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(profSeparationView.snp.bottom).offset(15)
//            make.left.right.equalTo(universityCodeLabel)
//        }
//        universityNameLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(universityNameTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(universityCodeLabel)
//        }
        univSeparationView.snp.makeConstraints { (make) in
            make.top.equalTo(universityNameLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
//        firstSubjectTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(univSeparationView.snp.bottom).offset(15)
//            make.left.equalTo(universityCodeLabel)
//            make.right.equalTo(secondSubjectSeparionView.snp.left).offset(10)
//        }
//        firstSubjectLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(firstSubjectTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(firstSubjectTitleLabel)
//        }
//        secondSubjectSeparionView.snp.makeConstraints { (make) in
//            make.top.equalTo(univSeparationView.snp.bottom)
//            make.width.equalTo(1)
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(moreInfoSeparionView.snp.top)
//        }
//        secondSubjectTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(univSeparationView.snp.bottom).offset(15)
//            make.right.equalTo(universityCodeLabel)
//            make.left.equalTo(secondSubjectSeparionView.snp.left).offset(20)
//        }
//        secondSubjectLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(secondSubjectTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(secondSubjectTitleLabel)
//        }
//        moreInfoSeparionView.snp.makeConstraints { (make) in
//            make.top.equalTo(secondSubjectLabel.snp.bottom).offset(30)
//            make.height.equalTo(1)
//            make.left.right.equalToSuperview()
//        }
//        moreInfoBtn.snp.makeConstraints { (make) in
//            make.top.equalTo(siteSeparationView.snp.bottom).offset(15)
//            make.left.right.equalTo(universityCodeLabel)
//            make.height.equalTo(50)
//            make.bottom.equalToSuperview().offset(-15)
//        }
//        totalGrantTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(moreInfoSeparionView.snp.bottom).offset(15)
//            make.left.equalTo(universityCodeLabel)
//            make.right.equalTo(grantOneSeparionView.snp.left).offset(10)
//        }
//        totalGrantLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(totalGrantTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(totalGrantTitleLabel)
//        }
//        grantOneSeparionView.snp.makeConstraints { (make) in
//            make.top.equalTo(moreInfoSeparionView.snp.bottom)
//            make.width.equalTo(1)
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(grantSeparionView.snp.top)
//        }
//        grantScoreTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(totalGrantTitleLabel)
//            make.right.equalTo(universityCodeLabel)
//            make.left.equalTo(grantOneSeparionView.snp.left).offset(20)
//        }
//        grantScoreLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(grantScoreTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(grantScoreTitleLabel)
//        }
//        grantSeparionView.snp.makeConstraints { (make) in
//            make.top.equalTo(grantScoreLabel.snp.bottom).offset(30)
//            make.height.equalTo(1)
//            make.left.right.equalToSuperview()
//        }
        cityNameTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(univSeparationView.snp.bottom).offset(15)
            make.left.right.equalTo(universityCodeLabel)
        }
        cityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityNameTitleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(universityCodeLabel)
        }
        citySeparationView.snp.makeConstraints { (make) in
            make.top.equalTo(cityNameLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
//        siteTitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(citySeparationView.snp.bottom).offset(15)
//            make.left.right.equalTo(universityCodeLabel)
//        }
//        siteTextView.snp.makeConstraints { (make) in
//            make.top.equalTo(siteTitleLabel.snp.bottom).offset(5)
//            make.left.right.equalTo(universityCodeLabel)
//            make.height.equalTo(30)
//        }
//        siteSeparationView.snp.makeConstraints { (make) in
//            make.top.equalTo(siteTextView.snp.bottom).offset(10)
//            make.height.equalTo(1)
//            make.left.right.equalToSuperview()
//        }
    }
    
//    @objc func moreInfoDidTaped() {
//        ifExpanded = !ifExpanded
//        for content in moreContent {
//            content.isHidden = !ifExpanded
//        }
//        if ifExpanded {
//            moreInfoBtn.setTitle("Less", for: .normal)
//            moreInfoBtn.snp.remakeConstraints { (make) in
//                make.top.equalTo(siteSeparationView.snp.bottom).offset(15)
//                make.left.right.equalTo(universityCodeLabel)
//                make.height.equalTo(50)
//                make.bottom.equalToSuperview().offset(-15)
//            }
//        } else {
//            moreInfoBtn.setTitle("More Info", for: .normal)
//            moreInfoBtn.snp.remakeConstraints { (make) in
//                make.top.equalTo(moreInfoSeparionView.snp.bottom).offset(15)
//                make.left.right.equalTo(universityCodeLabel)
//                make.height.equalTo(50)
//                make.bottom.equalToSuperview().offset(-15)
//            }
//        }
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: [], animations: { [weak self] in
//            guard let wSelf = self else { return }
//            wSelf.layoutIfNeeded()
//            }, completion: nil)
//    }
}
