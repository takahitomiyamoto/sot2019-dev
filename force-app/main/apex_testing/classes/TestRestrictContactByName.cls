@isTest(seeAllData=false)
private class TestRestrictContactByName {
  @testSetup
  static void setup() {
    Contact contact01 = new Contact();
    contact01.LastName = 'John';
    Database.insert(contact01, true);

    Contact contact02 = new Contact();
    contact02.LastName = 'Cachy';
    Database.insert(contact02, true);
  }

  @isTest
  static void testInsertContact() {
    Test.startTest();
    Contact contact = new Contact();
    contact.LastName = 'Michael';
    Database.insert(contact, true);
    Test.stopTest();

    System.assert(true, '');
  }

  @isTest
  static void testUpdateContact() {
    Test.startTest();
    Contact contact = [SELECT Id, LastName FROM Contact WHERE LastName = 'John'];
    Database.update(contact, true);
    Test.stopTest();

    System.assert(true, '');
  }

  @isTest
  static void testInsertContacts() {
    Test.startTest();
    List<Contact> contacts = [SELECT Id, LastName FROM Contact WHERE LastName IN ('John', 'Cachy', 'INVALIDNAME')];
    Database.update(contacts, true);
    Test.stopTest();

    System.assert(true, '');
  }

  @isTest
  static void testInsertContactInvalid() {
    Test.startTest();
    Contact contact03 = new Contact();
    contact03.LastName = 'INVALIDNAME';
    Database.SaveResult result = Database.insert(contact03, false);
    Test.stopTest();

    System.assert(!result.isSuccess(), '');
    System.assert(result.getErrors().size() > 0, '');
    System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage(), '');
  }
}
