import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["amount", "bank", "fintoc"]

  connect() {
    console.log("Bank Account Controller connected!");
  }

  selectAccount(event) {
    console.log("hello from select account")
    const selectedBankAccountId = this.bankTarget.value
    console.log("value", this.bankTarget.value )

    fetch(`/fintoc_accounts?bank_account_id=${selectedBankAccountId}`)
        .then(response => response.json())
        .then(data => {
          this.fintocTarget.innerHTML = "";
          console.log("data", data)
          data.forEach((fintocAccount) => {
            const option = document.createElement("option");
            option.value = fintocAccount.id;
            option.text = fintocAccount.name;
            console.log("fintocTarget", this.fintocTarget);
            this.fintocTarget.appendChild(option);
          });
        });
  }

  periodThousand(event) {


    // this.amountTarget.addEventListener("input", (e) => {
    //   const keyCode = event.which;
    //   const invalidKeys = [32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 45, 47];
    //   console.log(invalidKeys)
    //   if (!invalidKeys.includes(keyCode)) {
    //     event.preventDefault();
    //  }
    // });

    // if this.amountTarget.value.length is 0 and a user types in a letter /[a-z][A-Z]/ return and empty string

    console.log(this.amountTarget.value.length)
    if((/[0-9]/).test(this.amountTarget.value)) {
      const value = parseFloat(this.amountTarget.value.replace(/\.|,/g, ''));
      const formattedValue = value.toLocaleString("es-CL");
      this.amountTarget.value = formattedValue;
    } else {
      this.amountTarget.value = ""
    }






  }
}
