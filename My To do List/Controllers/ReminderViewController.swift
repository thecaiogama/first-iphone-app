import UIKit

class ReminderViewController: UIViewController {

    @IBOutlet weak var txtReminder: UITextField!

    @IBAction func btnSave(sender: AnyObject) {
        
        let needToRemember = txtReminder.text
        if needToRemember != "" {
            ReminderHelper.remindMeTo(needToRemember)
            self.returnHome()
        } else {
            self.error(txtReminder)
        }
    }
    
    @IBAction func cancelTapped(sender:AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    private func error(textField: UITextField) {
        textField.layer.borderColor = UIColor.redColor().CGColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        self.shakeTextField(textField)
    }
    
    private func returnHome() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func shakeTextField(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.08
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(textField.center.x - 10, textField.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(textField.center.x + 10, textField.center.y))
        textField.layer.addAnimation(animation, forKey: "position")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    

}
