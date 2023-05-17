public class ContactTriggerHandler {
 
    public static void beforeInsertHandler(List<Contact> gelenList){
        for(Contact cnt : gelenList){
            cnt.description = System.UserInfo.getName() + ' tarafından update edildi.';
        }
    }
    
    public static void activeContacts(List<Contact>cntList){
        
        Set<Id>accIds =new Set<Id>();
        
        for(Contact con:cntList){
           
                accIds.add(con.AccountId);
            
        }
         if(accIds.size()>0){
             
              List<Account> relatedAccs =[SELECT Id, Name, Active_Contacts__c, (SELECT Id, Active__c FROM Contacts WHERE Active__c = true) FROM Account WHERE Id IN : accIds];
       
              List<Account> accUpdate =new List<Account>();
               
        for(Account accs:relatedAccs){
            accs.Active_Contacts__c = accs.Contacts.size();
            accUpdate.add(accs);
          }
             update accUpdate;
         }
    }
}