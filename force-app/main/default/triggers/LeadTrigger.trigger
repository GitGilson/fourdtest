trigger LeadTrigger on Lead (before insert, before update) {

     LeadTriggerHandler.validaCEP(Trigger.new);
    


}