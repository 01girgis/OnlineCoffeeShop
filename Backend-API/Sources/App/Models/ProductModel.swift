//
//
//
//  Created by Romany GirGis, 2021.
//  Copyright © 2022 All rights reserved

import FluentKit
import Vapor


//Base Model Class
final class Product: Model,Content{
    //schema select
    static let schema = "product"
    
    //fields
    @ID(key: .id)
    var id:UUID?
    
    @Field (key: "name")
    var name:String
    
    @Field (key: "price")
    var price:Float
    
    @OptionalField(key: "description")
    var description: String?
    
    //Class Constructor
    init() {
        
    }
    
    init(id:UUID? = nil,name:String ,price:Float ,description:String){
        self.id = id
        self.name = name
        self.price = price
        self.description =  description
    }
}
