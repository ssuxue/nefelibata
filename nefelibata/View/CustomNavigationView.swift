//
//  CustomNavigationView.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/24.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    // This is view that requires search bar.
    var view: MessageView
    
    // onSearch And onCancel Closures
    var onSearch: (String) -> ()
    var onCancel: () -> ()
    
    // Require closure on call.
    
    init(view: MessageView, onSearch: @escaping (String) -> (), onCancel: @escaping () -> ()) {
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    // Integrating UIKit navigation controller with SwiftUI view.
    func makeUIViewController(context: Context) -> UINavigationController {
        // There requires SwiftUI view.
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        
        // TODO: 这里整了很久都没办法去除topItem.title所占的一大截空间
//        controller.navigationBar.topItem?.title = "消息"
//        controller.navigationBar.prefersLargeTitles = false
        
        // search bar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "搜索"
        
        // setting delegate.
        searchController.searchBar.delegate = context.coordinator
        
        // Modify cancel button title.
        // 这里我在网上找了很多方法都不行，应该是在swift5版本中那些方法都不生效
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "取消"
        
        // disabling dim bg
        searchController.obscuresBackgroundDuringPresentation = false
        
        // Disabling hide on scroll.
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
    // Search bar delegate.
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // When the text changes.
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // When cancel button is clicked.
            self.parent.onCancel()
        }
    }
}
