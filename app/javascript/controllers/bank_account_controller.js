import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fintocAccountSelect"];

  connect() {
    console.log("Bank Account Controller connected!");
    this.updateFintocAccounts();
  }

  onChange() {
    this.updateFintocAccounts();
  }

  async updateFintocAccounts() {
    const bankAccountId = this.element.value;

    if (!bankAccountId) {
      this.clearOptions();
      return;
    }

    try {
      const response = await fetch(`/fintoc_accounts?bank_account_id=${bankAccountId}`);
      const fintocAccounts = await response.json(); // Parse the response as JSON

      this.clearOptions();
      this.appendOptions(fintocAccounts);
    } catch (error) {
      console.error("Error fetching fintoc accounts:", error);
    }
  }

  clearOptions() {
    this.fintocAccountSelectTargets.forEach(target => {
      target.innerHTML = ""; // Clear the options
    });
  }

  appendOptions(fintocAccounts) {
    this.fintocAccountSelectTargets.forEach(target => {
      fintocAccounts.forEach(fintocAccount => {
        const option = document.createElement("option");
        option.value = fintocAccount.id;
        option.textContent = fintocAccount.name;
        target.appendChild(option);
      });
    });
  }
}
