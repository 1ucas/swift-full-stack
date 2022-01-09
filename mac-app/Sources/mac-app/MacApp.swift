import SwiftUI

@main
struct HelloWorld: App {

  init() {
    DispatchQueue.main.async {
      NSApp.setActivationPolicy(.regular)
      NSApp.activate(ignoringOtherApps: true)
      NSApp.windows.first?.makeKeyAndOrderFront(nil)
    }    
  }
  
  var body: some Scene {
    WindowGroup { 
      ContentView()
        .frame(minWidth: 640, minHeight: 320)
    }
  }
}