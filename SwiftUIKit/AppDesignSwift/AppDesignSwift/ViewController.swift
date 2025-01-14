//
//  ViewController.swift
//  AppDesignSwift
//
//  Created by Nefise Hazır on 10.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title="Pizza"
        
        let apperance=UINavigationBarAppearance()
        apperance.backgroundColor=UIColor(named: "mainColor")
        apperance.titleTextAttributes=[.foregroundColor:UIColor(named: "mainTextColor")!,.font:UIFont(name: "Pacifico-Regular", size: 22)!]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance=apperance
        navigationController?.navigationBar.compactAppearance=apperance
        navigationController?.navigationBar.scrollEdgeAppearance=apperance
    }


}

