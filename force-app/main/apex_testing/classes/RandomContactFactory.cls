public class RandomContactFactory {
  public static List<Contact> generateRandomContacts(Integer count, String lastName) {
    List<Contact> contacts = new List<Contact>();
    for (Integer i = 0; i < count; i++) {
      Contact newContact = new Contact();
      newContact.FirstName = 'Test ' + i;
      newContact.LastName = lastName;
      contacts.add(newContact);
    }
    return contacts;
  }
}
