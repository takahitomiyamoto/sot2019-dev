@isTest(seeAllData=false)
private class TestVerifyDate {
  @isTest
  static void testCheckDates01() {
    Date date1 = Date.valueOf('2016-06-01');
    Date date2 = Date.valueOf('2016-06-01');
    Date date0 = date2;

    System.assertEquals(date0, VerifyDate.CheckDates(date1, date2), '');
  }

  @isTest
  static void testCheckDates02() {
    Date date1 = Date.valueOf('2016-06-01');
    Date date2 = Date.valueOf('2017-06-01');
    Date date0 = Date.valueOf('2016-06-30');

    System.assertEquals(date0, VerifyDate.CheckDates(date1, date2), '');
  }

  @isTest
  static void testCheckDates03() {
    Date date1 = Date.valueOf('2016-06-02');
    Date date2 = Date.valueOf('2016-06-01');
    Date date0 = Date.valueOf('2016-06-30');

    System.assertEquals(date0, VerifyDate.CheckDates(date1, date2), '');
  }
}
