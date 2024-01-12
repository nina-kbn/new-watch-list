import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["begin_at", "end_at"];
  static values = {
    dates: Array,
  };

  connect() {
    const allDates = this.datesValue;

    flatpickr(this.begin_atTarget, {
      mode: "range",
      dateFormat: "d-m-Y",
      minDate: "today",
      disable: allDates,
      onChange: (selectedDates) => {
        this.updateDateText(selectedDates);
      },
    });
  }

  send() {
    const startDate = this.begin_atTarget.value.split(" to ")[0];
    const endDate = this.begin_atTarget.value.split(" to ")[1];

    this.end_atTarget.value = endDate;

    if (this.end_atTarget.value === "undefined") {
      this.end_atTarget.value = startDate;
    }

    this.begin_atTarget.value = startDate;
  }

  updateDateText(selectedDates) {
    if (selectedDates.length === 2) {
      const startDateStr = selectedDates[0].toLocaleDateString("fr-FR");
      const endDateStr = selectedDates[1].toLocaleDateString("fr-FR");
      const displayText = `du ${startDateStr} au ${endDateStr}`;

      this.begin_atTarget.value = displayText;
      this.end_atTarget.value = selectedDates[1].toISOString();
    }
  }
}
