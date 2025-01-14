//
//  ViewController.swift
//  TabBarSwift
//
//  Created by Nefise Hazır on 14.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabItems=tabBarController?.tabBar.items{
            let anasayfaItem=tabItems[0]
            let ayarlarItem=tabItems[1]
            
            anasayfaItem.badgeValue="3"
            ayarlarItem.badgeValue="yeni"
        }
        let appearence=UITabBarAppearance()
        appearence.backgroundColor=UIColor.systemIndigo
        
        renkDeğiştir(itemApperance: appearence.stackedLayoutAppearance)
        renkDeğiştir(itemApperance: appearence.inlineLayoutAppearance)
        renkDeğiştir(itemApperance: appearence.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance=appearence
        tabBarController?.tabBar.scrollEdgeAppearance=appearence
    }
    
    func renkDeğiştir(itemApperance:UITabBarItemAppearance){
        itemApperance.selected.iconColor=UIColor.systemRed
        itemApperance.selected.titleTextAttributes=[.foregroundColor:UIColor.green]
        itemApperance.selected.badgeBackgroundColor=UIColor.magenta
        
        itemApperance.normal.iconColor=UIColor.white
        itemApperance.normal.titleTextAttributes=[.foregroundColor:UIColor.white]
        itemApperance.normal.badgeBackgroundColor=UIColor.white
    }


}

