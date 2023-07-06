@isTest
public class ListaCpfCnpjKolect_tst {
    
    @TestSetup static void CarregarDados() {
        Lead l = new Lead();
        l.LastName = 'teste l';
        l.CPF__c = '32747244083';
        l.Company = 'teste';
        insert l;
        
        Account a = new Account();
        a.name = 'teste a';
        a.CPF__c = '32747244083';
        insert a;
        
        Opportunity o = new Opportunity();
        o.Name = 'teste o' ;
        o.CPF__c = '32747244083';
        o.StageName ='xx'; 
        o.CloseDate= Date.today();
        insert o;
        
        Lead l2 = new Lead();
        l2.LastName = 'teste l';
        l2.CNPJ__c = '12332747244083';
        l2.Company = 'teste';
        insert l2;
        
        Account a2 = new Account();
        a2.name = 'teste a';
        a2.CNPJ__c = '12332747244083';
        insert a2;
        
        Opportunity o2 = new Opportunity();
        o2.Name = 'teste o' ;
        o2.CNPJ__c = '12132747244083';
        o2.StageName ='xxxxxx'; 
        o2.CloseDate= Date.today();
        insert o2;
        
    }
    
    @isTest static void getDetalhesLead_Test() {
        Lead lead = [select id from lead limit 1];
        
        Test.startTest();
        ListaCpfCnpjKolect_ctr.getDetalhesLead(lead.id);
        Test.stopTest();
        
        
    }
}