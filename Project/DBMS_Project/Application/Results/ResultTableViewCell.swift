//
//  ResultTableViewCell.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    lazy var professionCodeLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.text = "5B110300"
        return lbl
    }()
    lazy var professionNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Фармация"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 26)
        return lbl
    }()
    lazy var profSeparationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
    lazy var universityNameTitleLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "University"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = Constants.mainColor
        return lbl
    }()
    lazy var universityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Казахский национальный медицинский университет имени С. Д. Асфендиярова (КазНМУ)"
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var univSeparationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
    lazy var firstSubjectTitleLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "First Subject"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = Constants.mainColor
        return lbl
    }()
    lazy var firstSubjectLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Math"
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var secondSubjectSeparionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
    lazy var secondSubjectTitleLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Second Subject"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.textColor = Constants.mainColor
        return lbl
    }()
    lazy var secondSubjectLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Biology"
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var moreInfoSeparionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbColor(r: 0, g: 0, b: 0, alpha: 0.05)
        return view
    }()
    lazy var moreInfoBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Constants.mainColor
        btn.setTitle("More Info", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.semanticContentAttribute = .forceRightToLeft
        //        showResultsBtn.contentHorizontalAlignment = .left;
        btn.addTarget(self, action: #selector(moreInfoDidTaped), for: .touchUpInside)
        //        showResultsBtn.contentEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30);
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5)
        //        showResultsBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (showResultsBtn.imageView?.frame.width ?? 0))
        let imageView = UIImageView()
        let image = UIImage(named: "go")?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .white
        btn.setImage(imageView.image, for: .normal)
        //        showResultsBtn.semanticContentAttribute = UIApplication.shared
        //            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        return btn
    }()
    lazy var cityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Almaty"
        return lbl
    }()
    lazy var examScoreLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "99"
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configUI()
        self.makeConstraints()
    }
}


// MARK: ConfigUI and Constraints
extension ResultTableViewCell {
    func configUI() {
        addSubview(professionCodeLabel)
        addSubview(professionNameLabel)
        addSubview(profSeparationView)
        addSubview(universityNameTitleLabel)
        addSubview(universityNameLabel)
        addSubview(univSeparationView)
        addSubview(firstSubjectTitleLabel)
        addSubview(firstSubjectLabel)
        addSubview(secondSubjectSeparionView)
        addSubview(secondSubjectTitleLabel)
        addSubview(secondSubjectLabel)
        addSubview(moreInfoSeparionView)
        addSubview(moreInfoBtn)
        addSubview(cityNameLabel)
        addSubview(examScoreLabel)
    }
    
    func makeConstraints() {
        professionCodeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        professionNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(professionCodeLabel.snp.bottom).offset(2)
            make.left.right.equalTo(professionCodeLabel)
        }
        profSeparationView.snp.makeConstraints { (make) in
            make.top.equalTo(professionNameLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        universityNameTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profSeparationView.snp.bottom).offset(15)
            make.left.right.equalTo(professionCodeLabel)
        }
        universityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(universityNameTitleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(professionCodeLabel)
        }
        univSeparationView.snp.makeConstraints { (make) in
            make.top.equalTo(universityNameLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        firstSubjectTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(univSeparationView.snp.bottom).offset(15)
            make.left.equalTo(professionCodeLabel)
            make.right.equalTo(secondSubjectSeparionView.snp.left).offset(10)
        }
        firstSubjectLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstSubjectTitleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(firstSubjectTitleLabel)
        }
        secondSubjectSeparionView.snp.makeConstraints { (make) in
            make.top.equalTo(univSeparationView.snp.bottom)
            make.width.equalTo(1)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(moreInfoSeparionView.snp.top)
        }
        secondSubjectTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(univSeparationView.snp.bottom).offset(15)
            make.right.equalTo(professionCodeLabel)
            make.left.equalTo(secondSubjectSeparionView.snp.left).offset(20)
        }
        secondSubjectLabel.snp.makeConstraints { (make) in
            make.top.equalTo(secondSubjectTitleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(secondSubjectTitleLabel)
        }
        moreInfoSeparionView.snp.makeConstraints { (make) in
            make.top.equalTo(secondSubjectLabel.snp.bottom).offset(30)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        moreInfoBtn.snp.makeConstraints { (make) in
            make.top.equalTo(moreInfoSeparionView.snp.bottom).offset(15)
            make.left.right.equalTo(professionCodeLabel)
            make.height.equalTo(50)
        }
    }
    
    @objc func moreInfoDidTaped() {
        
    }
}
