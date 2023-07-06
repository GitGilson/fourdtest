public class ListaCpfCnpjKolect_ctr {
    
    @auraEnabled
    public static String getDetalhesLead(Id recId) {
        list<obj> allrecord  = new list<obj>();
        
        Lead  l = [select id, name,CPF__c,CNPJ__c from Lead where id =:recId]; 
        String cpfCnpj = l.CPF__c != null ? l.CPF__c :l.CNPJ__c;
        
        for(Account acc : [select id, name,CPF__c,CNPJ__c from account 
                           									where (cpf__C = :cpfCnpj AND CPF__c != null) 
                           										OR (cnpj__c =: cpfCnpj AND cnpj__c != null) ]){
            obj local = new obj();
            local.id = acc.id;
            local.Nome = acc.name;
            local.CPF = acc.CPF__c;
            local.CNPJ = acc.CNPJ__c; 
            local.origem = 'Conta';  
            allrecord.add(local);	
        }
        
        for(Lead lead : [select id, name,CPF__c,CNPJ__c from Lead 
                         								where (cpf__C = :cpfCnpj AND CPF__c != null) 
                           										OR (cnpj__c =: cpfCnpj AND cnpj__c != null) ]){
            Obj local = new Obj();
            local.id = lead.id;
            local.Nome = lead.name;
            local.CPF = lead.CPF__c;
            local.CNPJ = lead.CNPJ__c; 
            local.origem = 'Lead';  
            allrecord.add(local);	
        }
        
        for(Opportunity opp : [select id, name,CPF__c,CNPJ__c from Opportunity 
                               									where (cpf__C = :cpfCnpj AND CPF__c != null) 
                           											OR (cnpj__c =: cpfCnpj AND cnpj__c != null) ]){
            Obj local = new Obj();
            local.id = opp.id;
            local.Nome = opp.name;
            local.CPF = opp.CPF__c;
            local.CNPJ = opp.CNPJ__c; 
            local.origem = 'Opp';  
            allrecord.add(local);	
        }
        
        system.debug('GSL allrecord :' + allrecord);
        
        return JSON.serialize(allrecord);
        
    }
    
    
    public class Obj {
        public String id     {get;set;} 
        public String CPF    {get;set;} 
        public String CNPJ   {get;set;}
        public String Nome   {get;set;}
        public String origem {get;set;}
        
        
    }
    
}