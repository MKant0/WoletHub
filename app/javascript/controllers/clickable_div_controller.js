import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  handleClick() {
    console.log("Div clicked!");
  }
}
