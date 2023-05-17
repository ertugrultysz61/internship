public class AccountBatchRelatedOpp implements Database.Batchable<sObject>, Database.stateful{
 integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext BC){
     	return Database.getQueryLocator([SELECT id, name, active__c, (SELECT id FROM Opportunities WHERE isClosed=false) FROM Account]);
   }

   public void execute(Database.BatchableContext BC, List<Account> AccList){
       for(Account acc : AccList){
           if(acc.Opportunities.size()==0){
           acc.active__c = 'No';    
           count++;
           }else{
               acc.active__c ='Yes';
           }
           
       }
    	update(AccList);
    }

   public void finish(Database.BatchableContext BC){
       System.debug('Batch Apex calisti ve ' + count + 'tane account deactive edildi.');
   } 
    
}