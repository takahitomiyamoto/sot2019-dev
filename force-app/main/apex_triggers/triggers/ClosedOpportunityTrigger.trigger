trigger ClosedOpportunityTrigger on Opportunity(after insert, after update) {
  OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
  handler.invoke();
}
