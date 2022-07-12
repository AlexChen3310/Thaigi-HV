//
//  Builder.swift
//  imf88
//
//  Created by 游宗諭 on 2020/8/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
@dynamicMemberLookup public struct Builder<Subject> {
    internal init(_ subject: Subject) {
        self.subject = subject
    }
    
  
  private typealias FISetter<Value> = ((Value) -> Builder<Subject>)
  
  let subject: Subject
  
  // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
  // 回傳值是一個 Setter 方法
  public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> Builder<Subject>) {
    
    var subject = self.subject
    
    return { value in
      subject[keyPath: keyPath] = value
        return Builder(subject)
    }
  }
  
  /// [Flentinterface] get the subject.
  public func build() -> Subject {
    subject
  }
  /// [Fluentinterface] Quick way to touch subject and remain fluent interface
  /// - Parameter handlel: A cloure to get the subject
  public nonmutating func handlingSubject(_ handle:
    (Subject) -> Void) -> Self {
    handle(subject)
    return self
  }
  /// [Fluentinterface] Quick way to manipulate subject and remain fluent interface
  /// - Parameter handle: A cloure to inout set subject
  public nonmutating func manipulateSubjct(_ handle:
    (inout Subject) -> Void) -> Self {
    var subject = self.subject
    handle(&subject)
    return Builder(subject)
  }
}
