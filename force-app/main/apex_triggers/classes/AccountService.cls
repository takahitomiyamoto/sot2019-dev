public with sharing class AccountService {
  private List<Account> accounts;

  private AccountService() {
    System.debug(LoggingLevel.FINEST, 'AccountService() is called.');
  }

  public AccountService(List<Account> accounts) {
    this.accounts = accounts;
  }

  private Boolean hasBillingPostalCode(Account account) {
    if (String.isNotEmpty(account.BillingPostalCode)) {
      return true;
    } else {
      return false;
    }
  }

  private Boolean isMatchBillingAddress(Account account) {
    if (account.Match_Billing_Address__c) {
      return true;
    } else {
      return false;
    }
  }

  private Boolean validate(Account account) {
    if (account == null) {
      return false;
    }

    Boolean result = (this.hasBillingPostalCode(account) && this.isMatchBillingAddress(account));
    return result;
  }

  public void doMatchBillingAddress() {
    Iterator<Account> iteratorAccount = this.accounts.iterator();
    while (iteratorAccount.hasNext()) {
      Account account = iteratorAccount.next();
      if (this.validate(account)) {
        account.ShippingPostalCode = account.BillingPostalCode;
      }
    }
  }
}
