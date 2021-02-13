//
//  ContactPickerViewModel.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/26/21.
//

import Foundation
import SwiftUI

public class ContactPickerViewModel: ObservableObject {
    
    @Published public var contactList: [ContactGroup] = []
    @Published public var contacts: [Contact] = []
    @Published public var searchedContacts: [SearchedContact] = []
    
    public init() {
        
        self.contacts = ContactService.shared.fetch()
        self.contactList = ContactService.shared.group(contacts)
        
    }
    
    public func search(text: String) {
        
        if text == "" {
            searchedContacts = []
        } else {
            searchedContacts = contacts
                .filter({ $0.matchesSearchText(text).match })
                .map({ SearchedContact(contact: $0, text: $0.matchesSearchText(text).text ?? "") })
        }
        
    }
    
}
