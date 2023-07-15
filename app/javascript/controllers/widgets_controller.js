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
        webhookUrl: 'https://wolethab-914-db0606c8d9c5.herokuapp.com/webhook',
        onSuccess: function(response) {
          window.location.href = `https://wolethab-914-db0606c8d9c5.herokuapp.com//bank_accounts`
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
