//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Stas Lee on 20/8/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private let loadFeed: (() -> Void)
    
    private(set) lazy var view = loadView()
    
    init(loadFeed: @escaping (() -> Void)) {
        self.loadFeed = loadFeed
    }
        
    @objc func refresh() {
        loadFeed()
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}

extension FeedRefreshViewController: FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel) {
        viewModel.isLoading ? view.beginRefreshing() : view.endRefreshing()
    }
}
