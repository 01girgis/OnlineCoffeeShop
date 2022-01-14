//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Vapor

//Database Processes
struct ProductController:RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let dataTable = routes.grouped("products")
        
        //Get Request
        dataTable.get(use: getMethod)
    }
    
    //Get Request Function
    func getMethod(req:Request) -> EventLoopFuture<[Product]>{
        return Product.query(on: req.db).all()
    }
}
