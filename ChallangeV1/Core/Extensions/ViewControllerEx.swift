//
//  ViewControllerEx.swift
//  ChallangeV1
//
//  Created by Abdelrahman Nasser on 4/12/21.
//

import UIKit
import SnapKit

extension UIViewController {
    func add(child: UIViewController, at containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.view.snp.makeConstraints { make in
            make.top.equalTo(containerView)
            make.bottom.equalTo(containerView)
            make.leading.equalTo(containerView)
            make.trailing.equalTo(containerView)
        }
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func removeAllChilds() {
        if !self.children.isEmpty {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers {
                viewContoller.remove()
            }
        }
    }
    
    func hideAllChilds() {
        if !self.children.isEmpty {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers {
                viewContoller.view.isHidden = true
            }
        }
    }
    
    func getChild(of: AnyClass) -> UIViewController? {
        if !self.children.isEmpty {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers {
                if viewContoller .isKind(of: of) {
                    return viewContoller
                }
            }
        }
        return nil
    }
    
    func dismissChildrenViewControllers() {
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func showIndicatorAnimation() {
        let appDelegat = UIApplication.shared.delegate as? AppDelegate
        guard (appDelegat?.window) != nil else { return }
        
        
        let containerView = UIView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = .black
        containerView.alpha = 0.85
        containerView.tag = 2020
        
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.color = .white
        indicatorView.center = containerView.center
        indicatorView.startAnimating()
        
        containerView.addSubview(indicatorView)
        self.view.addSubview(containerView)
    }
    
    func hideIndicatorAnimation() {
        let appDelegat = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegat?.window else { return }
        guard window.rootViewController != nil else { return }
        
        self.view.subviews.first(where: { $0.tag == 2020 })?.removeFromSuperview()
    }
}
