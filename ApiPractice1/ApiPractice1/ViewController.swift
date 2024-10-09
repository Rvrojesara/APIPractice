//
//  ViewController.swift
//  ApiPractice1
//
//  Created by admin on 09/10/24.
//

import UIKit

class ViewController: UIViewController {

    var Catarr:[Catmodel]=[]
    @IBOutlet weak var tablevc: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callcat()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    

    func callcat(){
        ApiManager().fetchcat{ result in
            switch result{
            case.success(let data):
                self.Catarr.append(contentsOf: data)
                print(self.Catarr)
                self.tablevc.reloadData()
                
            case.failure(let error):
                debugPrint("Something went wrong")
            }
        }
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func setup(){
        tablevc.delegate=self
        tablevc.dataSource=self
        tablevc.register(UINib(nibName: "CatCell", bundle: nil), forCellReuseIdentifier: "CatCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Catarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatCell
        cell.idlabel.text=Catarr[indexPath.row].id
        cell.urllabel.text=Catarr[indexPath.row].url
        cell.widthlabel.text=String(Catarr[indexPath.row].width)
        cell.heightlabel.text=String(Catarr[indexPath.row].height)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

