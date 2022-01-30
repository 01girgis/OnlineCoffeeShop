//
//  SheetActionsPresenter.swift
//  Frontend-Admin-App
//
//  Created by crus on 28.01.2022.
//

import SwiftUI

struct SheetActionsPresenter: View {
    @StateObject var vModel = ProductListModelView()

    @State var sD:String = ""
    @State var price:String = ""
    @State var description:String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        TextField("Enter your Name",text: $sD)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Price",text: $price)
            .padding()
            .border(.black)
            .cornerRadius(50)
        TextField("Enter your Descrition",text: $description)
            .padding()
            .border(.black)
            .cornerRadius(50)

        Button{
            let sending = Product(id: nil, name: sD, price: Float(price) ?? 0, description: description )
            Task{
            do {
                try await vModel.SendData(ToObject: sending)
            }
            catch{
//                throw ApiErr.invalidRsponse
                print("error posting data")
            }}
            dismiss()
        }label:{
            Text("Update")
        }
    }
}

struct SheetActionsPresenter_Previews: PreviewProvider {
    static var previews: some View {
        SheetActionsPresenter()
    }
}
