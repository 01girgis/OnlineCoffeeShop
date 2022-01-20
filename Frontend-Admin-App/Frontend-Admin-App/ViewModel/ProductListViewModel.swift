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
    }
}
