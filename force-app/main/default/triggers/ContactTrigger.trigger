/* trigger ContactTrigger on Contact (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
SWITCH on Trigger.operationType {
        WHEN BEFORE_INSERT  { 
        ContactTriggerHandler.beforeInsertHandler(Trigger.new);
        }
        WHEN BEFORE_UPDATE  { 
        ContactTriggerHandler.beforeInsertHandler(Trigger.new);
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }

    } 
}  */

trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete){
   
    if(trigger.isInsert||trigger.isUpdate||trigger.isUndelete){
            ContactTriggerHandler.activeContacts(Trigger.new);
    }
    
    if(trigger.isDelete){
        	ContactTriggerHandler.activeContacts(Trigger.old);
    }
}