import UIKit

var thingToDo = [String]()

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tblTodo: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("thingsToDo") != nil {
            thingToDo = NSUserDefaults.standardUserDefaults().objectForKey("thingsToDo") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingToDo.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = thingToDo[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var doneButton = UITableViewRowAction(style: .Default, title: "Done!", handler: { (action, indexPath) in
            ReminderHelper.done(indexPath.row)
            self.tblTodo.reloadData()
        })
        doneButton.backgroundColor = UIColor.greenColor()
        return [doneButton]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


}

