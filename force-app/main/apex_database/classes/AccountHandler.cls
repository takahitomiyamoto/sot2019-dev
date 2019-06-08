public with sharing class AccountHandler {
  public static Account insertNewAccount(String name) {
    try {
      Account account = new Account();
      account.Name = name;
      Database.insert(account, true);
      return account;
    } catch (DmlException de) {
      System.debug(Logginglevel.ERROR, 'A DML exception has occurred: ' + de.getMessage());
      return null;
    }
  }
}
