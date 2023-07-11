import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fintocAccountSelect"];

  connect() {
    console.log("Bank Account Controller connected!");
    this.updateFintocAccounts();
  }

  periodThousand(event) {
    console.log("it works")
    console.log(event)

    const value = currentTarget.value.replace(/.|,/g, '');
    const formattedValue = value.toLocaleString();
    currentTarget.value = formattedValue;

  }
}
