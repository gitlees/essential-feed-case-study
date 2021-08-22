//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Stas Lee on 22/8/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import EssentialFeed

// MARK: ISP: What if the view that renders its loading state is not the one that renders the feed

protocol FeedLoadingView {
    func display(isLoading: Bool)
}

protocol FeedView {
    func display(feed: [FeedImage])
}

class FeedPresenter {
    private let feedLoader: FeedLoader
    
    var feedView: FeedView?
    var loadingView: FeedLoadingView?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        loadingView?.display(isLoading: true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.feedView?.display(feed: feed)
            }
            self?.loadingView?.display(isLoading: false)
        }
    }
}
