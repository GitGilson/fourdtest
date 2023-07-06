public class ContaPDFController {
    
    public Account account {get; set;}    
    public List<Opportunity> wonOppList {get; set;}
    public List<Opportunity> notWonOppList {get; set;}
    string accId = '0015f000002Lz0zAAC';
    
    public ContaPDFController () {
        this.account = [SELECT Id, Name, BillingStreet, BillingCity, BillingState, 
                               BillingPostalCode, BillingCountry,AnnualRevenue,SLAExpirationDate__c,SLA__c
                                FROM Account
                                WHERE Id =:accId 
                       ];
        
       
    }
}