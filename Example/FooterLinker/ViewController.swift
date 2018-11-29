//
//  ViewController.swift
//  FooterLinker
//
//  Created by Alice Migliorati on 11/29/2018.
//  Copyright (c) 2018 Alice Migliorati. All rights reserved.
//

import UIKit
import FooterLinker

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    
    private var footerLinker: FooterLinker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        footerLinker = FooterLinker(scrollView: tableView, footerView: footerView)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // uncomment for less elements (footer is anchored to the bottom)
//         return 2
        
        // unccoment for more elements (footer scrolls with the UITableView obj)
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
