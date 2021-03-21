//
//  TransactionPetitions.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import Foundation
import  UIKit

class WebService{
    func getTransactions (url : URL, ViewController : UIView, completion: @escaping (Any?) ->()){
        URLSession.shared.dataTask(with : url){ data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("error \(httpResponse.statusCode)")
                switch httpResponse.statusCode {
                case 200:
                    if let data = data{
                        let transactionList = try? JSONDecoder().decode(TransactionList.self, from: data)
                        if let transactionList = transactionList{
                            completion(transactionList.transactions)
                        }
                        print(transactionList as Any)
                    }
                    break
                case 400:
                    completion("Algo salio mal")
                    break
                case 420:
                    completion("information cannot be retrieve")
                    break
                default:
                    completion("No se pueden cargar los datos")
                    break
                }
            }
            if let error = error {
                print (error.localizedDescription)
            }
        }.resume()
    }
}
