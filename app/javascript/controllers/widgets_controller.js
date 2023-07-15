import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="widgets"
export default class extends Controller {
  startFintocProcess(event) {
    let BankAccountId = event.target.dataset.bankAccountId;
    sessionStorage.setItem('bankAccountId', BankAccountId);
  } 
  connect() {
    console.log("Hello, Stimulus!", this.element);
    window.onload = () => {
      const widget = Fintoc.create({
        publicKey: 'pk_test_xwUGiHD3-zsftKEioAvCGjAk6qQrTS65',
        holderType: 'individual',
        product: 'movements',
        webhookUrl: 'https://webhook.site/7c9c93d1-a80b-4886-8fa8-145c4215fb86',
        onSuccess: function(response) {
          fetch("/links", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
              "link": {
                "accounts": response.accounts,
                "active": response.active,
                "created_at": response.created_at,
                "holder_id": response.holder_id,
                "holder_type": response.holder_type,
                "link_token": response.id,
                "institution_id": response.institution.id,
                "institution_name": response.institution.name,
                "institution_country": response.institution.country,
                "link_token": response.link_token,
                "mode": response.mode,
                "username": response.username
              }
            })
          });

          console.log('Success! Here is the Link object:');
          console.log(response);
          localStorage.setItem('linkId', response.id); // guardar el link.id en el localStorage
        },

        onExit: function() {
          console.log('Widget closing!');
          window.location.href = `${BASE_URL}/bank_accounts`;
        },
        onEvent: function(event) {
          console.log('An event just happened!');
          console.log(event);
        }
      });

      widget.open();
    };
  }
}
