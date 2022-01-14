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
    }
}
