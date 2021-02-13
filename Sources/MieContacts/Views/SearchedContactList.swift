//
//  SearchedContactList.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/24/21.
//

import SwiftUI

public struct SearchedContactList: View {
    
    public let contacts: [SearchedContact]
    public let allowsMultiSelect: Bool
    public let onSelect: (Contact) -> Void
    
    public var body: some View {
    
        List(contacts) { searched in
            
            ContactCell(contact: searched.contact, allowsMultiSelect: allowsMultiSelect) { contact in
                
                onSelect(contact)
                
            }
            
        }
    
    }
    
}

struct SearchedContactList_Previews: PreviewProvider {
    static var previews: some View {
        SearchedContactList(
            contacts: [SearchedContact(contact: Contact(), text: "What's up, guys!?")],
            allowsMultiSelect: true,
            onSelect: { _ in })
    }
}
