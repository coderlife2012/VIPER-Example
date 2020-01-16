//
//  VideoViewController.swift
//  VIPER_POC
//
//  Created by Vinay Kumar on 16/01/20.
//  Copyright © 2020 Vinay Kumar. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    var videoPresenter:ViewToPresenterProtocol?
    
    @IBOutlet weak var myTableView: UITableView!
    var arrayList:Array<VideoList> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Video List"
        videoPresenter?.startFetchingVideoList()
        showProgressIndicator(view: self.view)
        
    }
    
}

extension VideoViewController:PresenterToViewProtocol {
    func showVideoList(videoArray: Array<VideoList>) {
         DispatchQueue.main.async {
            self.arrayList = videoArray
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            self.myTableView.reloadData()
            hideProgressIndicator(view: self.view)
        }
    }
    
    func showError(error: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension VideoViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCellIdentifier", for: indexPath) as! VideoTableViewCell
        cell.showVideoData(object: self.arrayList[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video  = self.arrayList[indexPath.row]
        videoPresenter?.showDetailController(navigationController: self.navigationController!,video: video)
    }
    
}



