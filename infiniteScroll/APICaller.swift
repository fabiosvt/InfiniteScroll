//
//  APICaller.swift
//  infiniteScroll
//
//  Created by Fabio Silvestri on 01/02/21.
//

import Foundation
class APICaller {
    var isPaginating = false
    let itemsDownload:Int = 5
    
    func fetchData(pagination:Bool = false, completion: @escaping (Result<[item_struct], Error>) -> Void){
        
        if pagination {
            isPaginating = true
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2) , execute: { [self] in
            var originalData: [item_struct] = []
            for index in 0...itemsDownload {
                let item = item_struct(name: "short value \(index)", descr: "\(index) longest value longest value longest value longest value longest value longest value longest value for text")
                originalData.append(item)
            }
         
            var newData: [item_struct] = []
            for index in 0...itemsDownload {
                let item = item_struct(name: "new short value \(index)", descr: "new \(index) longest value longest value longest value longest value longest value longest value longest value for text")
                newData.append(item)
            }

            completion(.success(pagination ? newData : originalData))
            
            if pagination {
                self.isPaginating = false
            }
        })
    }
}
