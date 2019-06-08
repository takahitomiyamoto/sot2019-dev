public with sharing class ContactAndLeadSearch {

  public static List<List<SObject>> searchContactsAndLeads(String name) {
    List<List<SObject>> searchContactsAndLeads = [
      FIND :name
      IN NAME FIELDS
      RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)
    ];
    return searchContactsAndLeads;
  }

}
