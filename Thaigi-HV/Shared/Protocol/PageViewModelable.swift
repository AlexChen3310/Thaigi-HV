//
//  PageViewModelable.swift
//  TFChessApp
//
//  Created by Johnny on 2020/9/2.
//  Copyright © 2020 Goldenf. All rights reserved.
//

import Foundation
import UIKit

protocol PageViewModelable {
    var feeds: [UIViewController] { get }
    var willMoveToViewController: ((UIViewController, UIPageViewController.NavigationDirection) -> ())? {get set}
    func shouldMoveToViewControllerAtIndex(index:Int)
}
class PageViewModel: PageViewModelable {
    
    init(_ feeds: [UIViewController]) {
        self.feeds = feeds
    }
    
    var feeds: [UIViewController] = []
    
    private var currentIndex = 0
    
    var willMoveToViewController: ((UIViewController, UIPageViewController.NavigationDirection) -> ())?
    
    func shouldMoveToViewControllerAtIndex(index: Int) {
        let nextIndex = max(0, min(index, feeds.count))
        let destinationVC = feeds[nextIndex]
        let direction: UIPageViewController.NavigationDirection = nextIndex > currentIndex ? .forward : .reverse
        currentIndex = nextIndex
        willMoveToViewController?(destinationVC, direction)
    }
}
