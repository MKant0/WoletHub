import { Controller } from "@hotwired/stimulus";

export default class extends Controller {


  connect() {
    console.log("Bank Account Controller connected!");
  }

  periodThousand(event) {
    console.log("it works")
    console.log(event)
    debugger

    const value = currentTarget.value.replace(/\.|,/g, '');
    const formattedValue = value.toLocaleString();
    currentTarget.value = parseInt(formattedValue);

    // const value = event.target.value.replace(/\.|,/g, "");
    // const formattedValue = value.toLocaleString();
    // event.target.value = pasreInt(formattedValue);

  }
}
