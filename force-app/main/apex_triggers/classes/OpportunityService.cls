public with sharing class OpportunityService {
  private List<Opportunity> opportunities;

  private OpportunityService() {
    System.debug(LoggingLevel.FINEST, 'OpportunityService() is called.');
  }

  public OpportunityService(List<Opportunity> opportunities) {
    this.opportunities = opportunities;
  }

  public void iterateAddTask() {
    List<Task> taskList = new List<Task>();
    for (Opportunity opp: [SELECT Id FROM Opportunity WHERE Id IN :this.opportunities AND StageName = 'Closed Won']) {
      Task newTask = new Task();
      newTask.Subject = 'Follow Up Test Task';
      newTask.WhatId = opp.Id;
      taskList.add(newTask);
    }
    Database.insert(taskList, true);
  }
}
