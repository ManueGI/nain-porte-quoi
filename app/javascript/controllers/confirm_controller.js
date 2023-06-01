import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["green"]

  getconfirm() {
    console.log("confirmation")
    this.greenTarget.classList.add("teste")
  }
}
