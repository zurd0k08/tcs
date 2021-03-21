//
//  TransactionViewController.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var transactionTableview: UITableView!
    
    var transactions : [Transaction] = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        configure()
    }
    
    func cellRegister(){
        transactionTableview.register(UINib.init(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "TransactionCell" )
        transactionTableview.rowHeight = UITableView.automaticDimension
        transactionTableview.separatorColor = .black
    }
    
    func configure(){
        WebService().getTransactions(url: urlAPI){ transactions in
            if let transactions = transactions as? [Transaction]{
                self.transactions = transactions
                DispatchQueue.main.async {
                    self.transactionTableview.reloadData()
                }
            }
            else {
                if let transactionsMessage = transactions as? String{
                    DispatchQueue.main.async {
                        AlertImage.shared.showAlertImage(title: "¡Error!", message: transactionsMessage, type: .failure, view: self.view, image: "error")
                    }
                }
            }
        }
    }

}

extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        cell.selectionStyle = .none
        let transaction = transactions[indexPath.row]
        cell.imageCell.image = UIImage(named: "tImg")
        cell.descCell.text = transaction.description
        cell.amountLbl.text = "$\(transaction.amount)"
        cell.idLbl.text = "ID: \(transaction.id)"
        switch transaction.status {
        case "active":
            cell.statusView.backgroundColor = .green
        default:
            cell.statusView.backgroundColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = transactions[indexPath.row]
        print("\(indexPath.row) - \(transaction.description)")
    }
}
