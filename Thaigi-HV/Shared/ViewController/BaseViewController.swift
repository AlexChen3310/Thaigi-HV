//
//  BaseViewController.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/8.
//

import UIKit

class BaseViewController: UIViewController {
    deinit{
        print(Self.self, #function)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .custom
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        super.modalPresentationStyle = .custom
        self.modalPresentationStyle = .custom
    }
    private var loadingView: HUDViewController?{
        didSet{
            oldValue?.dismiss(animated: false, completion: nil)
        }
    }
    
    private var isLoading = false
    
    var needBGView = false
    
    lazy var navigationBarBackButton:UIBarButtonItem = {
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self, action: #selector(self.navigationBackButtonDidPress), for: .touchUpInside)
        backButton.setImage(UIImage(named: "ic_back"), for: .normal)
        let buttonItem = UIBarButtonItem(customView: backButton)
        //iOS 11 - Navigation bar come up with Autolayout so frame setting may not work
        let currWidth = buttonItem.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = buttonItem.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        return buttonItem
    }()
    
    lazy var navigationBarCloseButton:UIBarButtonItem = {
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self, action: #selector(self.navigationCloseButtonDidPress), for: .touchUpInside)
        backButton.setImage(UIImage(named: "cancel18Px"), for: .normal)
        let buttonItem = UIBarButtonItem(customView: backButton)
        //iOS 11 - Navigation bar come up with Autolayout so frame setting may not work
        let currWidth = buttonItem.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = buttonItem.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        return buttonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    @objc func navigationBackButtonDidPress(){
        
    }
    @objc func navigationCloseButtonDidPress(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Public
extension BaseViewController {
    
    func updateLoadingStatus(needShow: Bool){
        isLoading = needShow
        if needShow {
            self.loadingView = Target.loading.getTargetVC() as? HUDViewController
            UIApplication.topViewController()?.present(self.loadingView!, animated: false, completion: nil)
        }else{
            self.loadingView?.dismiss(animated: false, completion: nil)
            self.loadingView = nil
        }
    }
}
