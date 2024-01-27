import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  var statusBar: StatusBarController?
  var popover = NSPopover.init()
  
  override init() {
    popover.behavior = NSPopover.Behavior.transient
  }
  
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }
  
  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
    popover.contentSize = NSSize(width: 300, height: 300)
    popover.contentViewController = controller
    statusBar = StatusBarController.init(popover)
    guard let window = mainFlutterWindow else {
      print("mainFlutterWindow is nil")
      return
    }
    window.close()
    super.applicationDidFinishLaunching(notification)
  }
}
