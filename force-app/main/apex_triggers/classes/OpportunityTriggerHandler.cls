public with sharing class OpportunityTriggerHandler {
  private List<Opportunity> oldOpportunies;
  private List<Opportunity> newOpportunies;
  private Map<ID, Opportunity> oldOpportunityMap;
  private Map<ID, Opportunity> newOpportunityMap;

  public static Boolean firstRun = true;

  public OpportunityTriggerHandler() {
    this.oldOpportunies = (List<Opportunity>) Trigger.old;
    this.newOpportunies = (List<Opportunity>) Trigger.new;
    this.oldOpportunityMap = (Map<ID, Opportunity>) Trigger.oldMap;
    this.newOpportunityMap = (Map<ID, Opportunity>) Trigger.newMap;
  }

  @TestVisible
  private void iterateAddTask() {
    OpportunityService service = new OpportunityService(this.newOpportunies);
    service.iterateAddTask();
  }

  private void onAfterInsert() {
    this.iterateAddTask();
  }

  private void onAfterUpdate() {
    this.iterateAddTask();
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
        when AFTER_INSERT {
          this.onAfterInsert();
        }
        when AFTER_UPDATE {
          this.onAfterUpdate();
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
