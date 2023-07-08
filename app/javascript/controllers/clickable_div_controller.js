import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clickable-div"
export default class extends Controller {

  static targets = ["container"]

  connect(){
    
  }
  loadBankDetails(event) {
    event.preventDefault();
    const target = event.currentTarget
    const url = target.getAttribute("href");
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.containerTarget.innerHTML = data

    });

  }
}
