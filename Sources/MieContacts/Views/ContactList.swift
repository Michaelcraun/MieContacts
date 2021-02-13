//
//  ContactList.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/24/21.
//

import SwiftUI

public struct ContactList: View {
    
    @State public var contactGroups: [ContactGroup]
    public let allowsMultiSelect: Bool
    public let onSelect: (Contact) -> Void
    
    public var body: some View {
    
        List {
            
            ForEach(contactGroups) { group in
                
                Section(header: Text(group.id)) {
                    
                    ForEach(group.contacts) { contact in
                        
                        ContactCell(contact: contact, allowsMultiSelect: allowsMultiSelect, displaysKey: .jobTitle, displaysImage: true) { contact in
                            
                            onSelect(contact)
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
    
    }
    
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(contactGroups: .init(), allowsMultiSelect: true, onSelect: { _ in })
    }
}
