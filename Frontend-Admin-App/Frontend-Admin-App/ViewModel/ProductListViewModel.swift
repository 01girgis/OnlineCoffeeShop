//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation

class ProductListModelView: ObservableObject {
    @Published var prods = [Product]()
    
    //Get Request in ViewModel
    func Fetching() async throws {
        //url  parameters
        let url = FirstP.url + EndP.point
        
        //check url
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
        //Data  Fetching to class model
        let dataGet:[Product] = try await HttpSniffer.sharedSniffer.FetchData(url: urlPath)
        
        //add fetching method to main thread
        DispatchQueue.main.async {
            self.prods = dataGet
        }
    }
    
    //Post Request in ViewModel
    func SendData() async throws {
        //Prepare
        let url = FirstP.url + EndP.point
        guard let urlPath = URL(string: url) else {
            throw ApiErr.badUrl
        }
        
    }
}
