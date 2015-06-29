import Foundation


class ReminderHelper  {
    class func remindMeTo(rememberMeTo: String) {
        thingToDo.append(rememberMeTo)
        NSUserDefaults.standardUserDefaults().setObject(thingToDo, forKey: "thingsToDo")
    }
    
    class func done(reminderNumber: Int) {
        thingToDo.removeAtIndex(reminderNumber)
        NSUserDefaults.standardUserDefaults().setObject(thingToDo, forKey: "thingsToDo")
    }
}
