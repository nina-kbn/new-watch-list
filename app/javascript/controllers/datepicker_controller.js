import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
// import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "begin_at", "end_at" ]
  static values = {
          dates: Array
        }


  connect() {

    const allDates = this.datesValue


    flatpickr(this.begin_atTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      minDate: "today",
      disable: allDates
    })
  }


  send(){
    const startDate = this.begin_atTarget.value.split(" to ")[0]
    const endDate = this.begin_atTarget.value.split(" to ")[1]
    // this.end_atTarget.value = endDate
    // this.begin_atTarget.value = startDate
    this.end_atTarget.value = endDate
    if (this.end_atTarget.value === "undefined") {
      this.end_atTarget.value = startDate
    }
      this.begin_atTarget.value = startDate
  }
}
