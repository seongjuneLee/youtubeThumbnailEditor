//
//  HomeViewController.swift
//  ThummIt
//
//  Created by 이성준 on 2022/11/13.
//

import Foundation
import SnapKit

class HomeViewController : UIViewController {
    
    let tableView = UITableView()
    let tableViewViewModel = HomeTableViewModel()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        setUpView()
        
    }
    
    // set up view
    func setUpView() {
        
        // 타이틀 라벨
        let homeLabel = UILabel()
        homeLabel.text = "홈"
        homeLabel.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 25)
        homeLabel.sizeToFit()
        self.view.addSubview(homeLabel)
        
        // 타이틀라벨 constraint
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
        }
        
        // 새로 만들기
        let makeNewBGImage = UIImageView(image: UIImage(named: "makeNewPreview"))
        makeNewBGImage.clipsToBounds = true
        makeNewBGImage.layer.cornerRadius = 20
        view.addSubview(makeNewBGImage)
        makeNewBGImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(homeLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(150)
        }
        
        let makeNewButton = UIButton()
        makeNewButton.addTarget(self, action: #selector(makeNewThumbnail), for: .touchUpInside)
        makeNewButton.backgroundColor = .clear
        makeNewButton.titleLabel?.numberOfLines = 0
        makeNewButton.titleLabel?.textAlignment = .center
        makeNewButton.setTitle("+\n새로 만들기", for: .normal)
        view.addSubview(makeNewButton)
        makeNewButton.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalTo(makeNewBGImage)
        }
        
        // tableView
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(makeNewButton.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
        
    @objc func makeNewThumbnail(sender : UIButton) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}
