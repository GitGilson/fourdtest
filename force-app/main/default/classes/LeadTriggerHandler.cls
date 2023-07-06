public class LeadTriggerHandler {

    
    public static void validaCEP(List<Lead> leads) {
        for (Lead lead : leads) {
            if (lead.PostalCode != null) {
                String postalCode = lead.PostalCode;
                 SYSTEM.debug('0GSL : '+ postalCode );
                // Remover qualquer caractere que não seja número
                postalCode = postalCode.replaceAll('[^0-9]', '');
                
                SYSTEM.debug('1GSL : '+ postalCode );
                 postalCode = postalCode.substring(0, 5) + '-' + postalCode.substring(5);
               
                // Verificar o formato e comprimento do CEP
                if (!isValidPostalCode(postalCode)) {
                    lead.addError('O campo Postal Code deve estar no formato XXXXX-XXX ou conter apenas números.');
                } else {
                    
                    lead.PostalCode = postalCode;
                }
            }
        }
    }
    
    Private static Boolean isValidPostalCode(String postalCode) {
        // Verificar se o CEP tem o formato correto
        
        Pattern pattern = Pattern.compile('^[0-9]{5}(-[0-9]{3})');
         SYSTEM.debug('2GSL : '+ postalCode );
         SYSTEM.debug('GSL pattern: '+ pattern );
        Matcher matcher = pattern.matcher(postalCode);
        return matcher.matches();
    }
}