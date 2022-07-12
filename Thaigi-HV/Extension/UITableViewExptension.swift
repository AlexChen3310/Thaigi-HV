//
//  UITableViewExptension.swift
//  imf88
//
//  Created by Johnny on 2020/10/13.
//  Copyright © 2020 Goldenf. All rights reserved.
//

import class UIKit.UITableView
import class UIKit.UIView
import class UIKit.UIActivityIndicatorView
import struct Foundation.IndexSet
import struct Foundation.IndexPath
import struct UIKit.CGRect
import class UIKit.NSLayoutConstraint
public protocol PagingTableViewDelegate:AnyObject {
    func didPaginate(_ pagingTableViewPresenter: PagingTableViewPresenter, to page: Int)
    func paginate(_ pagingTableViewPresenter: PagingTableViewPresenter, to page: Int)
}

extension PagingTableViewDelegate {
    func didPaginate(_ pagingTableViewPresenter: PagingTableViewPresenter, to page: Int) { }
}

open class PagingTableViewPresenter {
    public init(
        tableView: UITableView,
        indicator: UIActivityIndicatorView = UIActivityIndicatorView(),
        pagingDelegate: PagingTableViewDelegate?) {
        self.tableView = tableView
        self.indicator = indicator
        self.pagingDelegate = pagingDelegate
    }
    
    var tableView:UITableView
    var indicator: UIActivityIndicatorView
    private var _tempFooterView: UIView?
    internal var page: Int = 0
    internal var previousItemCount: Int = 0
    internal var previousPageCount = 0
    
    open var currentPage: Int {
        get {
            return page
        }
    }
    
    open weak var pagingDelegate: PagingTableViewDelegate? {
        didSet {
            pagingDelegate?.paginate(self, to: page)
        }
    }
    
    open private(set) var isLoading: Bool = false
    func startLoading() {
        showLoading()
        self.isLoading = true
    }
    func stopLoading() {
        self.isLoading = false
        hideLoading()
    }
//    func stopLoading(insertSectionWithRowCount count:Int, with rowAnimation: UITableView.RowAnimation = .none) {
//        self.isLoading = false
//        hideLoading()
//        tableView.reloadData()        
//    }
    
    open func reset() {
        page = 0
        previousItemCount = 0
        pagingDelegate?.paginate(self, to: page)
    }
    func loadFirstPage() {
        pagingDelegate?.paginate(self, to: page)
    }
    func startPaginateIfNeed(forRowAt indexPath: IndexPath) {
        guard
            let totalSectionCount = tableView.dataSource?.numberOfSections?(in: tableView),
            let totalItemCount = tableView.dataSource?.tableView(tableView, numberOfRowsInSection: indexPath.section),
            indexPath.row == totalItemCount - 1,
            indexPath.section == totalSectionCount - 1 else { return }
        page += 1
        previousItemCount = totalItemCount
        pagingDelegate?.paginate(self, to: page)
    }
    
    private func showLoading() {
        _tempFooterView = tableView.tableFooterView
        tableView.tableFooterView = createLoadingView()
        indicator.startAnimating()
    }
    
    private func hideLoading() {
        indicator.stopAnimating()
        pagingDelegate?.didPaginate(self, to: page)
        tableView.tableFooterView = _tempFooterView
        _tempFooterView = nil
    }
    
    private func createLoadingView() -> UIView {
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        loadingView.addSubview(indicator)
        let xCenterConstraint = NSLayoutConstraint(
            item: loadingView, attribute: .centerX, relatedBy: .equal,
            toItem: indicator, attribute: .centerX, multiplier: 1, constant: 0
        )
        loadingView.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(
            item: loadingView, attribute: .centerY, relatedBy: .equal,
            toItem: indicator, attribute: .centerY, multiplier: 1, constant: 0
        )
        loadingView.addConstraint(yCenterConstraint)
        return loadingView
    }
}

