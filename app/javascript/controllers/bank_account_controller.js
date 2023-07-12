import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["amount"]

  connect() {
    console.log("Bank Account Controller connected!");
  }

  periodThousand(event) {
    // console.log("it works")
    // console.log("event", event)
    // console.log("value", this.amountTarget.value)
    // console.log("formated-value", this.amountTarget.value.replace(/\.|,/g, ''))
    // const randnumber = 100000
    // console.log("randnumber", randnumber.toLocaleString("de-DE"))
    // console.log("randnumber-chile", randnumber.toLocaleString("es-CL"))


    const value = parseFloat(this.amountTarget.value.replace(/\.|,/g, ''));
    const formattedValue = value.toLocaleString("es-CL");
    this.amountTarget.value = formattedValue;



  }
}
