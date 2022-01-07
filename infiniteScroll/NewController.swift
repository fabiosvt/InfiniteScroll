//
//  NewController.swift
//  infiniteScroll
//
//  Created by Fabio Silvestri on 02/02/21.
//

import Foundation

class NewController: NewControllerDelegate {
    func goToProductDetail(didSelect infiniteProduct: String, atIndex index: Int) {
        let apiCaller = APICaller()
        print(infiniteProduct)
        apiCaller.fetchData(pagination: true, completion: { [weak self] result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(_):
                print("failure")
            }
        })
    }
}
