//
//  AlertImage.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit

class AlertImage: UIView {
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var msjLbl: UILabel!
    @IBOutlet weak var btnAlert: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var imageImg: UIImageView!
    
    static let shared = AlertImage()
    var responseButton : Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("alertImage", owner: self, options: nil)
        applyView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private func applyView(){
        parentView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        parentView.layer.cornerRadius = 16.0
        alertView.layer.cornerRadius = 20.0
        btnAlert.layer.cornerRadius = 10
    }
    
    enum AlertType{
        case success
        case failure
        case none
    }
    
    func showAlertImage(title: String, message: String, type: AlertType, view : UIView, image : String){
    imageImg.image = UIImage(named: image)!
    self.titleLbl.text = title
    self.msjLbl.text = message
    switch type {
        case .success:
            btnAlert.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .failure:
            btnAlert.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            
        case .none:
            break
    }
    view.addSubview(parentView)
        //UIApplication.shared.keyWindow?.addSubview(parentView)
}
    
    @IBAction func doneAction(_ sender: Any){
        responseButton = true
        parentView.removeFromSuperview()
    }
    
    func closeAlert(){
        parentView.removeFromSuperview()
    }

}

