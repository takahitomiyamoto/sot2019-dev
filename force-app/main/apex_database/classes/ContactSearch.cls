public with sharing class ContactSearch {

  public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
    if (!Contact.sObjectType.getDescribe().isAccessible()) {
      return null;
    }
    List<Contact> contacts = [
      SELECT Id, Name
      FROM Contact
      WHERE Lastname = :lastName AND MailingPostalCode = :mailingPostalCode
    ];
    return contacts;
  }

}
