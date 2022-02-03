//
//
//
//  Created by Romany GirGis, 2022.
//  Copyright © 2022 All rights reserved

import SwiftUI

struct SheetModalView: View {
    /*Variables Initialization*/
    //Main View Model
    @StateObject var mainModel = ProductListModelView()
    //SubView Model
    @ObservedObject var sheetMod = ActionSheetViewModel()
    //Enviromental Variables
    @Environment(\.dismiss) var endView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SheetModalView_Previews: PreviewProvider {
    static var previews: some View {
        SheetModalView()
    }
}
