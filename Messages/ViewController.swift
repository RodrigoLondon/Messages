//
//  ViewController.swift
//  Messages
//
//  Created by Lewis Jones on 17/07/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

import UIKit


struct Message {
    var sender: Sender
    var message: String
    var date: String
}

struct Sender {
    var name: String
    var avatar: UIImage?
}



var contacts = [
    
Sender(name: "Bill Gates", avatar: UIImage(named: "BillGates")),
Sender(name: "Steve Jobs", avatar: UIImage(named: "SteveJobs")),
Sender(name: "Elon Musk", avatar: UIImage(named: "ElonMusk"))
    
]

var fakeData = [

    Message(sender: contacts[0], message: "Blah", date: "12/12/16"),
    Message(sender: contacts[1], message: "Blah", date: "12/12/18"),
    Message(sender: contacts[2], message: "Blah", date: "12/12/18")

]


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ToggleTableViewCellDelegate {

    
    enum Section: Int {
        case doNotDisturb
        case messages
        
    var title: String {
        switch self {
                case .doNotDisturb:
                    return "Do not disturb"
                case .messages:
                    return "My messages"
        }
      }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages = fakeData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Section(rawValue: section)!  {
        case .doNotDisturb:
            return 1
        case .messages:
            return messages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Section(rawValue: indexPath.section)! {
        case .doNotDisturb:
           let cell = tableView.dequeueReusableCell(withIdentifier: "ToggleTableViewCell", for: indexPath)
           if let cell = cell as? ToggleTableViewCell {
            cell.delegate = self
            }
            return cell
        case .messages:
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        let message = messages[indexPath.row]
        
        if let cell = cell as? MessageTableViewCell {
            cell.nameLabel.text = message.sender.name
            cell.messageLabel.text = message.message
            cell.avatarView.image = message.sender.avatar
            cell.dateLabel.text = message.date
        }
        return cell
    
        }
    }
    func didToggle(isOn: Bool) {
        print("Toggle status: \(isOn)")
    }
    
    // Custom Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        header.backgroundColor = .gray
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = Section(rawValue: section)?.title
        header.addSubview(label)
        label.sizeToFit()
        label.center = header.center
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // Simple Header
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch Section(rawValue: section)! {
//        case .doNotDisturb:
//            return "Do not disturb"
//        case .messages:
//            return "My messages"
//        }
//    }
}

