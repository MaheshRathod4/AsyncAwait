//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Mahesh Rathod on 28/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewPosts: UITableView!
    private var postViewModal = PostViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        Task {
            await postViewModal.requestPosts()
            DispatchQueue.main.async { [self] in tableViewPosts.reloadData() }
        }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModal.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPosts.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.setupUI(post: postViewModal.posts[indexPath.row])
        return cell
    }
}

