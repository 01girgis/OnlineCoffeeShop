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
        
        //Put Request
        dataTable.put(use: updateMethod)
    }
    
    //Get Request Function
    func getMethod(req:Request) throws -> EventLoopFuture<[Product]>{
        return Product.query(on: req.db).all()
    }
    
    //Post Request Function
    func postMethod(req:Request) throws -> EventLoopFuture<HTTPStatus>{
        let sendPost = try req.content.decode(Product.self)
        return sendPost.save(on: req.db).transform(to: .ok)
    }
    
    //Put Request Function
    func updateMethod(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        //Decoding Data Object
        let updateData = try req.content.decode(Product.self)
        return Product.find(updateData.id, on: req.db)
        //error check
            .unwrap(or: Abort(.notFound))
        //Mapping New Data Entries
            .flatMap{
                $0.name = updateData.name
                $0.price = updateData.price
                $0.description = updateData.description
                //Verify Http Return Request
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    
}
