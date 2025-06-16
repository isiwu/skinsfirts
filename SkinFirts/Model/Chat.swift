//
//  Chat.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 16/06/2025.
//

import Foundation
import SwiftData

@Model
class Chat {
  var body: String
  var seen: Bool
  var date: Date
  
  private var messageTypeRaw: MessageType.RawValue = MessageType.text.rawValue
  var messageType: MessageType {
    get { .init(rawValue: messageTypeRaw) ?? .text}
    set { messageTypeRaw = newValue.rawValue }
  }
  
  private var senderRaw: Sender.RawValue = Sender.owner.rawValue
  var sender: Sender {
    get { .init(rawValue: senderRaw) ?? .owner}
    set { senderRaw = newValue.rawValue }
  }
  
  enum MessageType: String {
    case text
    case image
  }
  
  enum Sender: String {
    case owner
    case user
  }
  
  init(body: String="", seen: Bool=false, date: Date = .now, messageType: MessageType = .text, sender: Sender = .owner) {
    self.body = body
    self.seen = seen
    self.date = date
    self.messageType = messageType
    self.sender = sender
  }
}
