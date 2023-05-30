import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = {
    reservedDates: Array
  }
  connect() {

    flatpickr(this.element, {
      disable: this.reservedDatesValue,
      mode: "range",
      minDate: "today"
    })
  }
}
