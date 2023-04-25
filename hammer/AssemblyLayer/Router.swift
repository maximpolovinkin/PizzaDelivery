//
//  Router.swift
//  hammer
//
//  Created by Максим Половинкин on 02.03.2023.
//

import Foundation
import UIKit
import FirebaseAuth

protocol RouterMain {
    var tabBar: UITabBarController? {get set}
    var assemblyBuilder: AssamblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialVC()
    func showDetail(menuItem: menuItems?, image: UIImage?)
    func updateTrash()
    func autorise()
    func unAutorise()
    func showEnterPhoneVC()
    func showEnterCodeVC(telephoneNumber number: String, superView: UIViewController, id: String)
}

class Router: RouterProtocol {
    var tabBar: UITabBarController?
    var assemblyBuilder: AssamblyBuilderProtocol?
    
    required init(tabBar: UITabBarController?, assemblyBuilder: AssamblyBuilderProtocol?) {
        self.tabBar = tabBar
        self.assemblyBuilder = assemblyBuilder
    }
    
     //MARK: Tab Bar
    func initialVC() {
        if let tabBar = tabBar {
            guard let mainVc = assemblyBuilder?.createMenuModule(router: self),
                  let contactsVC = assemblyBuilder?.createContacntsModule(router: self),
                  let authVC = assemblyBuilder?.createAutoriseeModule(router: self),
                  let trashVC = assemblyBuilder?.createTrashModule(router: self) else {return}
        
            let trashNavVc = UINavigationController()
            trashNavVc.viewControllers = [trashVC]
            trashNavVc.navigationBar.topItem?.title = "Корзина"
           
            let profileNavVC = UINavigationController()
            if Auth.auth().currentUser?.uid != nil {
                guard let profileVC = assemblyBuilder?.createProfileModule(router: self) else { return }
                profileNavVC.viewControllers = [profileVC]
                profileNavVC.navigationBar.topItem?.title = "Профиль"
            } else {
                profileNavVC.viewControllers = [authVC]
                profileNavVC.navigationBar.topItem?.title = "Профиль"
            }
            
            let mainVC = UINavigationController()
            let button = UIButton(type: .system)
            mainVC.viewControllers = [mainVc]
            button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            button.setTitle("Москва", for: .normal)
            button.sizeToFit()
            button.semanticContentAttribute = .forceRightToLeft
            let navItem = UINavigationItem(title: "")
            navItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
            tabBar.viewControllers = [mainVC, contactsVC, profileNavVC, trashNavVc]
         
            if #available(iOS 15.0, *) {
               let appearance = UITabBarAppearance()
               appearance.backgroundEffect = UIBlurEffect(style: .light)
                tabBar.tabBar.scrollEdgeAppearance = appearance
            }
            
            tabBar.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            tabBar.tabBar.selectedImageTintColor = #colorLiteral(red: 0.9875084758, green: 0.2303813398, blue: 0.41417557, alpha: 1)
        }
    }
    
     //MARK: Detail pizza screen
    func showDetail(menuItem: menuItems?, image: UIImage?) {
        if let tabBar = tabBar {
            guard let detailVC = assemblyBuilder?.createDetailModule(menuItem: menuItem, image: image) else { return }
            detailVC.modalPresentationStyle = .fullScreen
            tabBar.present(detailVC, animated: true)
        }
    }
    
     //MARK: Autorization
    func autorise() {
        if let tabBar = tabBar {
            guard let profile = assemblyBuilder?.createProfileModule(router: self) else { return }
            let profileNavVC = UINavigationController()
            profileNavVC.viewControllers = [profile]
            profileNavVC.navigationBar.topItem?.title = "Профиль"
            
            tabBar.viewControllers?[2] = profileNavVC
        }
    }
    
    func showEnterPhoneVC(){
        guard let vc = assemblyBuilder?.createEnterPhoneModule(router: self), let tabBar = tabBar else { return }
        let navVc = UINavigationController()
        navVc.viewControllers = [vc]
        
        tabBar.present(navVc, animated: true)
    }
    
    func showEnterCodeVC(telephoneNumber number: String, superView: UIViewController, id: String){
        guard let vc = assemblyBuilder?.createEnterCodeModule(router: self, id: id) else { return }
        superView.navigationController?.pushViewController(vc, animated: true)
    }
    
    func unAutorise() {
        do {
            try Auth.auth().signOut()
            
            if let tabBar = tabBar {
                guard let profile = assemblyBuilder?.createAutoriseeModule(router: self) else { return }
                let profileNavVC = UINavigationController()
                profileNavVC.viewControllers = [profile]
                profileNavVC.navigationBar.topItem?.title = "Профиль"
                
                tabBar.viewControllers?[2] = profileNavVC
            }
            
        } catch {
            
        }
    }
    
    func updateTrash() {
        
    }
}
