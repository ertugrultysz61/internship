public class AccountDelete implements Database.Batchable<sObject>{
 
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT id, name FROM Account WHERE name LIKE \'wise%\' ';
     	return Database.getQueryLocator(query);
   }

   public void execute(Database.BatchableContext BC, List<Account> scope){
    	Database.delete(scope);
    }

   public void finish(Database.BatchableContext BC){
       System.debug('Islem Basarili.');
   }
}