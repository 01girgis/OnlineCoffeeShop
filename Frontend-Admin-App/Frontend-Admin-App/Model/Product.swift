//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import Foundation

//Model Structure
struct Product: Identifiable , Codable{
    //Data fields
    var id:UUID?
    var name:String
    var price:Float
    var description:String?
}
