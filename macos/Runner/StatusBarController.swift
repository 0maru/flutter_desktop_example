//
//  StatusBarController.swift
//  Runner
//
//  Created by maru on 2024/01/28.
//

import AppKit

class StatusBarController {
  private var statusBar: NSStatusBar
  private var statusItem: NSStatusItem
  private var popover: NSPopover
  
  init(_ popover: NSPopover) {
    self.popover = popover
    statusBar = NSStatusBar.init()
    statusItem = statusBar.statusItem(withLength: 28.0)
    
    if let statusBarButton = statusItem.button {
      statusBarButton.image = #imageLiteral(resourceName: "StatusbarICon")
      statusBarButton.image?.size = NSSize(width: 18, height: 18)
      statusBarButton.image?.isTemplate = true
      statusBarButton.action = #selector(togglePopover(sender:))
      statusBarButton.target = self
    }
  }
  
  @objc func togglePopover(sender: AnyObject) {
    if (popover.isShown) {
      popover.performClose(sender)
    } else {
      if let statusBarButton  = statusItem.button {
        popover.show(
          relativeTo: statusBarButton.bounds,
          of: statusBarButton,
          preferredEdge: NSRectEdge.minX
        )
      }
    }
  }
}
