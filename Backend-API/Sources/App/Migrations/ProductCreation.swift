//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import FluentKit


struct ProductCreation:Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        //add schema & its Fields
        return database.schema("products")
            .id()
            .field("name", .string , .required)
            .field("price", .string , .required)
            .field("description", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("products").delete()
    }
}
