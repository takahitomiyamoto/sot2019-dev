trigger AccountAddressTrigger on Account(before insert, before update) {
  AccountTriggerHandler handler = new AccountTriggerHandler();
  handler.invoke();
}
