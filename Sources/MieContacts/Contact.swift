//
//  Contact.swift
//  ContactList_Test
//
//  Created by Michael Craun on 1/23/21.
//



import UIKit
import Contacts

@available(iOS 14, *)
struct Contact: Identifiable {
    
    typealias ContactRelation = (label: String, relation: CNContactRelation)
    typealias ContactDate = (label: String, date: Date)
    typealias ContactEmailAddress = (label: String, address: String)
    typealias ContactInstantMessageAddress = (label: String, address: CNInstantMessageAddress)
    typealias ContactPhoneNumber = (label: String, phoneNumber: CNPhoneNumber)
    typealias ContactPostalAddress = (label: String, address: CNPostalAddress)
    typealias ContactSocialProfile = (label: String, profile: CNSocialProfile)
    typealias ContactURLAddress = (label: String, address: String)
    
    private let contact: CNContact?
    
    let id: UUID = UUID()
    
    var birthday: Date? {
        return contact?.birthday?.date
    }
    var contactRelations: [ContactRelation] {
        return (contact?.contactRelations ?? []).map { ($0.label ?? "Unknown", $0.value)}
    }
    var contactType: CNContactType {
        return contact?.contactType ?? .person
    }
    var dates: [ContactDate] {
        return (contact?.dates ?? []).map { ($0.label ?? "Unknown", $0.value.date ?? Date() )}
    }
    var departmentName: String {
        return contact?.departmentName ?? ""
    }
    var emailAddresses: [ContactEmailAddress] {
        return (contact?.emailAddresses ?? []).map { ($0.label ?? "Unknown", String($0.value))}
    }
    var familyName: String {
        return contact?.familyName ?? "Contact"
    }
    var givenName: String {
        return contact?.givenName ?? "Unknown"
    }
    var identifier: String {
        return contact?.identifier ?? ""
    }
    var image: UIImage {
        if let data = imageData, imageDataAvailable {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage(systemName: "person.fill") ?? UIImage()
        }
    }
    var imageData: Data? {
        return contact?.imageData
    }
    var imageDataAvailable: Bool {
        return contact?.imageDataAvailable ?? false
    }
    var instantMessageAddresses: [ContactInstantMessageAddress] {
        return (contact?.instantMessageAddresses ?? []).map { ($0.label ?? "Unkown", $0.value)}
    }
    var jobTitle: String {
        return contact?.jobTitle ?? ""
    }
    var middleName: String {
        return contact?.middleName ?? ""
    }
    var namePrefix: String {
        return contact?.namePrefix ?? ""
    }
    var nameSuffix: String {
        return contact?.nameSuffix ?? ""
    }
    var nickname: String {
        return contact?.nickname ?? ""
    }
    var nonGregorianBirthday: Date? {
        return contact?.nonGregorianBirthday?.date
    }
    var organizationName: String {
        return contact?.organizationName ?? ""
    }
    var phoneNumbers: [ContactPhoneNumber] {
        return (contact?.phoneNumbers ?? []).map { ($0.label ?? "Unknown", $0.value)}
    }
    var phoneticFamilyName: String {
        return contact?.phoneticFamilyName ?? ""
    }
    var phoneticGivenName: String {
        return contact?.phoneticGivenName ?? ""
    }
    var phoneticMiddleName: String {
        return contact?.phoneticMiddleName ?? ""
    }
    var phoneticOrganzationName: String {
        return contact?.phoneticOrganizationName ?? ""
    }
    var postalAddresses: [ContactPostalAddress] {
        return (contact?.postalAddresses ?? []).map { ($0.label ?? "Unkown", $0.value) }
    }
    var previousFamilyName: String {
        return contact?.previousFamilyName ?? ""
    }
    var socialProfiles: [ContactSocialProfile] {
        return (contact?.socialProfiles ?? []).map { ($0.label ?? "Unknown", $0.value) }
    }
    var thumbnailImageData: Data? {
        return contact?.thumbnailImageData
    }
    var urlAddresses: [ContactURLAddress] {
        return (contact?.urlAddresses ?? []).map { ($0.label ?? "Unknown", String($0.value)) }
    }
    
    init() {
        self.contact = nil
    }
    
    init(contact: CNContact) {
        self.contact = contact
    }
    
    /// <#Description#>
    /// - TODO: Add documentation detailing what keys can be shown? -- OR --
    /// - TODO: Finish each case?
    /// - Parameter key: <#key description#>
    /// - Returns: <#description#>
    func valueFor(key: ContactService.Key) -> String {
        switch key {
        case .identifier: return identifier
        case .type: return "\(contactType)"
        case .birthday: return birthday?.description ?? ""
        case .gregorianBirthday: return nonGregorianBirthday?.description ?? ""
        case .departmentName: return departmentName
        case .jobTitle: return jobTitle
        case .organizationName: return organizationName
        case .phoeneticOrganizationName: return phoneticOrganzationName
//        case .emailAddresses: return ListFormatter.localizedString(byJoining: emailAddresses.map({ $0.address }))
//        case .instantMessageAddresses: return ListFormatter.localizedString(byJoining: instantMessageAddresses.map({ "\($0.label): \($0.address)" }))
//        case .postalAddresses: return ListFormatter.localizedString(byJoining: <#T##[String]#>)
//        case .urlAddresses:
//            <#code#>
//        case .familyName:
//            <#code#>
//        case .givenName:
//            <#code#>
//        case .middleName:
//            <#code#>
//        case .namePrefix:
//            <#code#>
//        case .nameSuffix:
//            <#code#>
//        case .nickname:
//            <#code#>
//        case .phoneticFamilyName:
//            <#code#>
//        case .phoneticGivenName:
//            <#code#>
//        case .phoneticMiddleName:
//            <#code#>
//        case .previousFamilyName:
//            <#code#>
//        case .phoneNumbers:
//            <#code#>
//        case .socialProfiles:
//            <#code#>
//        case .imageData:
//            <#code#>
//        case .imageDataAvailable:
//            <#code#>
//        case .thumnailData:
//            <#code#>
//        case .realtions:
//            <#code#>
        default: fatalError("BECAUSE FUCK YOU!")
        }
    }
    
    func matchesSearchText(_ text: String) -> (match: Bool, text: String?) {
        
        if departmentName.contains(text) {
            return (true, departmentName)
        } else if familyName.contains(text) {
            return (true, familyName)
        } else if givenName.contains(text) {
            return (true, givenName)
        } else if jobTitle.contains(text) {
            return (true, jobTitle)
        } else if middleName.contains(text) {
            return (true, middleName)
        } else if nickname.contains(text) {
            return (true, nickname)
        } else if organizationName.contains(text) {
            return (true, organizationName)
        } else if previousFamilyName.contains(text) {
            return (true, previousFamilyName)
        }
        
        for email in emailAddresses.map({ $0.address }) {
            if email.contains(text) {
                return (true, email)
            }
        }
        
        for imAddress in instantMessageAddresses.map({ $0.address }) {
            if imAddress.username.contains(text) {
                return (true, "\(imAddress.service): \(imAddress.username)")
            }
        }
        
        for number in phoneNumbers.map({ $0.phoneNumber }) {
            if number.stringValue.contains(text) {
                return (true, number.stringValue)
            }
        }
        
        for address in postalAddresses.map({ $0.address }) {
            let formatter = CNPostalAddressFormatter()
            formatter.style = .mailingAddress
            
            let textAddress = formatter.string(from: address)
            if textAddress.contains(text) {
                return (true, textAddress)
            }
        }
        
        for url in urlAddresses.map({ $0.address }) {
            if url.contains(text) {
                return (true, url)
            }
        }
        
        return (false, nil)
        
    }
    
}

extension Contact: Equatable {
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.contact == rhs.contact
    }
    
}

struct ContactGroup: Identifiable {
    
    let contacts: [Contact]
    let id: String
    
}

struct SearchedContact: Identifiable, Equatable {
    
    let contact: Contact
    let id: String = UUID().uuidString
    let text: String
    
}
