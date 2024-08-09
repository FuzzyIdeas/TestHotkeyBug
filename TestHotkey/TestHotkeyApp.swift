//
//  TestHotkeyApp.swift
//  TestHotkey
//
//  Created by Alin Panaitiu on 09.08.2024.
//

import Carbon
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let hotKeyId = EventHotKeyID(signature: 0x1234_2324, id: UInt32.random(in: 0 ... UInt32.max))
        var carbonHotKey: EventHotKeyRef?

        let eventDispatcherError = RegisterEventHotKey(
            UInt32(kVK_ANSI_A),
            UInt32(optionKey),
            hotKeyId,
            GetEventDispatcherTarget(),
            0,
            &carbonHotKey
        )
        print("Error with GetEventDispatcherTarget:", eventDispatcherError)

        let applicationEventError = RegisterEventHotKey(
            UInt32(kVK_ANSI_A),
            UInt32(optionKey),
            hotKeyId,
            GetApplicationEventTarget(),
            0,
            &carbonHotKey
        )
        print("Error with GetApplicationEventTarget:", applicationEventError)
    }
}

@main
struct TestHotkeyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
