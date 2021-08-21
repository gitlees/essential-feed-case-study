//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Stas Lee on 20/8/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private let viewModel: FeedViewModel
    
    private(set) lazy var view = binded(UIRefreshControl())
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
        
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { [weak self] viewModel in
            viewModel.isLoading ? self?.view.beginRefreshing() : self?.view.endRefreshing()
        }
        
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
