import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="widgets"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
    window.onload = () => {
      const widget = Fintoc.create({
        publicKey: 'pk_test_xwUGiHD3-zsftKEioAvCGjAk6qQrTS65',
        holderType: 'individual',
        product: 'movements',
        webhookUrl: 'https://webhook.site/7c9c93d1-a80b-4886-8fa8-145c4215fb86',
        onSuccess: function(link) {
          console.log('Success! Here is the Link object:');
          console.log(link);
          localStorage.setItem('linkId', link.id); // guardar el link.id en el localStorage
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
