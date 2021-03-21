//
//  transactionModel.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import Foundation


struct TransactionList : Decodable{
    let transactions : [Transaction]
}
struct Transaction : Decodable {
    var id: Int
    var description: String
    var amount : String
    var status: String
}
