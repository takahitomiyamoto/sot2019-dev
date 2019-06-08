public with sharing class AccountTriggerHandler {
  private List<Account> oldAccounts;
  private List<Account> newAccounts;
  private Map<ID, Account> oldAccountMap;
  private Map<ID, Account> newAccountMap;

  public static Boolean firstRun = true;

  public AccountTriggerHandler() {
    this.oldAccounts = (List<Account>) Trigger.old;
    this.newAccounts = (List<Account>) Trigger.new;
    this.oldAccountMap = (Map<ID, Account>) Trigger.oldMap;
    this.newAccountMap = (Map<ID, Account>) Trigger.newMap;
  }

  @TestVisible
  private void doMatchBillingAddress() {
    AccountService service = new AccountService(this.newAccounts);
    service.doMatchBillingAddress();
  }

  private void onBeforeInsert() {
    this.doMatchBillingAddress();
  }

  private void onBeforeUpdate() {
    this.doMatchBillingAddress();
  }

  @TestVisible
  private Boolean isRecursive() {
    if (firstRun) {
      return false;
    } else {
      return true;
    }
  }

  public void invoke() {
    System.Savepoint savepoint = Database.setSavepoint();
    try {
      if (this.isRecursive()) {
        return;
      }

      switch on Trigger.operationType {
        when BEFORE_INSERT {
          this.onBeforeInsert();
        }
        when BEFORE_UPDATE {
          this.onBeforeUpdate();
        }
        when else {
          firstRun = false;
          System.debug(Logginglevel.ERROR, 'not working.');
        }
      }
    } catch (Exception e) {
      Database.rollback(savepoint);
      System.debug(Logginglevel.ERROR, 'An exception has occurred: ' + e.getMessage());
    }
  }
}
