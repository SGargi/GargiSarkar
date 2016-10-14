public with sharing class MemContribution {
    public expense__c expObj{get;set;}
    public List<Contribution__c> memCon{get;set;}

    public MemContribution(ApexPages.StandardController controller) {
        expObj = (expense__c)controller.getRecord();
        memCon = getExpMembers();
    }
    
    public List<Contribution__c> getExpMembers(){
        return [Select Contribution__c,Member__r.First_Name__c from Contribution__c where Expense__c =: expObj.Id];
    }
}