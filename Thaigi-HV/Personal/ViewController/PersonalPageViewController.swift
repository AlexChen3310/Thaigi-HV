//
//  PersonalPageViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/9.
//

import UIKit
protocol PersonalPageDelegate: NSObjectProtocol {
    func pageScrollFinished(index:Int);
}

class PersonalPageViewController: UIPageViewController {
    
    var allViewControllers: [UIViewController] = []
    
    open weak var pageViewDelegate: PersonalPageDelegate?
    
    var currentIndex = 1
    
    init(viewControllers:[UIViewController], delegate: PersonalPageDelegate) {
        allViewControllers = viewControllers
        pageViewDelegate = delegate
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setPageDataSource() {
        dataSource = self
    }
    
    func setContentViewControllers(_ viewControllers:[UIViewController], delegate: PersonalPageDelegate){
        allViewControllers = viewControllers
        pageViewDelegate = delegate
    }
    
    func willMoveToViewControllerAtIndex(index:Int, pressedView:UIView) {
        let currentIndex = max(0, min(index, allViewControllers.count));
        let destinationVC = allViewControllers[currentIndex];
        self.setViewControllers([destinationVC], direction: .forward, animated: false, completion: nil);
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

fileprivate extension PersonalPageViewController{
    func setup() {
        delegate = self
//        dataSource = self
        if allViewControllers.count > 0{
            
        }
        guard let firstPage = allViewControllers[exist: 0] else {
            return
        }
        self.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil);
    }
}
extension PersonalPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            let viewController = pageViewController.viewControllers?.first;
            
            if viewController != nil {
                
                guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController!) else {
                    
                    return;
                }
                if viewControllerIndex == 1 || viewControllerIndex == 2{
                    currentIndex = viewControllerIndex
                }
                
                pageViewDelegate?.pageScrollFinished(index: viewControllerIndex)
            }
        }
    }
}
extension PersonalPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return allViewControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of:viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        if nextIndex > allViewControllers.count - 1{
            return nil
        }
        if viewControllerIndex != 0{
            return nil
        }else{
            return allViewControllers[nextIndex]
        }
    }
}
