public class WhatsappController {
 
    public void sendMessage(){
        String currentRecordId = Apexpages.currentPage().getParameters().get('id');
		Lead lead = [SELECT Name,phone FROM Lead WHERE Id = :currentRecordId];
        String whatsappNumber= '+351'+lead.phone;
        String mensagem = 'Olá '+lead.name+ ' tudo bem? Informamos que já estamos analisando seu cadastro para se tornar um de nossos clientes. Em breve retornaremos o contato.';
    
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://graph.facebook.com/v17.0/112267131919198/messages');  
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
     
        
  		String body ='{ "messaging_product": "whatsapp", "recipient_type": "individual", "to": "'+whatsappNumber+'", "type": "text", "text": { "preview_url": false, "body": "'+mensagem+'"} }';
        
        
        req.setBody(body);
        
        String token = 'EAAzActK4spoBADT0oV6fZBrAFclAAs27UpI8RJH80Phm99kpjg2Bj0QHzVkYRwJW16ZBeBRrZBio1ZA7Gqu7ETjv9PnFqK9RsQhL9k3ZAMlM3xk67R3wMuZBmT4XefHHStkR5InRdkhnY8lt91G4LPlBFpDKaAd6Uhz2UKOPcDZBP4eZANpuZA11qpCFClETC5SGyuAlaHK3g7pF85AyxSOun';
        req.setHeader('Authorization', 'Bearer ' + token);
        HttpResponse response = http.send(req);
        
        system.debug('Response :'+ response.getBody());
        
        if(response.getStatusCode() == 200){
            
            //mensagem de sucesso
            
        }else{ 
            //mensagem de erro
             
             }
        
        
       
    }
        
}