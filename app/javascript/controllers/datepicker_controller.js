import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin"

export default class extends Controller {
  static values = {
    reservedDates: Array,
    price: Number
  }

  static targets = [
    "datebegin",
    "dateend",
    "priceupdated"
]
  connect() {

    flatpickr(this.datebeginTarget, {
      disable: this.reservedDatesValue,
      mode: "range",
      plugins: [new rangePlugin({ input: this.dateendTarget})],
      minDate: "today",
      altInput: true,
      altFormat: "d/m/Y",
      dateFormat: "Y-m-d",
    })
  }

  getprice(){

    const  dates = this.datebeginTarget.value

    const datebegin  = dates.split(" to ")[0]
    const dateend  = dates.split(" to ")[1]

    const datebeginOK = new Date(datebegin)
    const dateendOK = new Date(dateend)
    console.log(dates)

    console.log(datebegin)
    console.log(dateend)

    var intervalle = dateendOK.getTime() - datebeginOK.getTime();
    intervalle = Math.floor(intervalle / (1000 * 60 * 60 * 24))
    console.log(intervalle)

   this.priceupdatedTarget.innerHTML = `${this.priceValue * (intervalle)}€`

  }
}
