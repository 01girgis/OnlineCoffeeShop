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
        
        //Post Request
        dataTable.post(use: postMethod)
    }
    
    //Get Request Function
    func getMethod(req:Request) throws -> EventLoopFuture<[Product]>{
        return Product.query(on: req.db).all()
    }
    
    func postMethod(req:Request) throws -> EventLoopFuture<HTTPStatus>{
        let sendPost = try req.content.decode(Product.self)
        return sendPost.save(on: req.db).transform(to: .ok)
    }
    
}
