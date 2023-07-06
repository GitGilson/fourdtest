@IsTest
private class LeadTriggerHandlerTest {
    @IsTest
    static void testValidPostalCode() {
        Lead lead = new Lead();
        lead.PostalCode = '12345-678';
        
        Test.startTest();
        insert lead;
        Test.stopTest();
        
        System.assertEquals('12345-678', lead.PostalCode);
    }
     
    @IsTest
    static void testInvalidPostalCode() {
        Lead lead = new Lead();
        lead.PostalCode = 'A1B2C3D';
        
        Test.startTest();
        try {
            insert lead;
        } catch (DmlException e) {
            String errorMessage = e.getDmlMessage(0);
            System.assert(errorMessage.contains('O campo Postal Code deve estar no formato XXXXX-XXX ou conter apenas números.'));
        }
        Test.stopTest();
    }
}