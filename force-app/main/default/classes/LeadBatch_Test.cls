@isTest
public class LeadBatch_Test {
    
@isTest
    static void leadCreation(){
        List<Lead> listLead = new List<Lead>();
        for(integer i=1; i<200; i++){         
            Lead Ld = new lead();
            Ld.LastName = 'TestName'+i;
            Ld.Company = 'TestCompany'+i;
            Ld.Status = 'open - not contacted';
            Ld.LeadSource = '';
            ListLead.add(Ld);
        }
        insert listLead;
        
        test.startTest();
            LeadBatch runBatch = new LeadBatch();
            Database.executeBatch(runBatch, 200);
            
            LeadBatch runSchedule = new LeadBatch();
            String cron = '0 0 0 * * ?';
            System.schedule('my Schedulable Apex', cron, runSchedule);
        test.stopTest();
        
    }

}