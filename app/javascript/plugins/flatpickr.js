import flatpickr from "flatpickr";

// const initFlatpickr = () => {
//   flatpickr(".datepicker", {
//     altInput: true
//   });
// }
// Check that the query selector id matches the one you put around your form.

const initFlatpickr = () => {
  const startDateInput = document.getElementById('booking_check_in');
  const endDateInput = document.getElementById('booking_check_out');

  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#camel-booking-dates').dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      // dateFormat: "Y-m-d",
      altInput: true
    });

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        // dateFormat: "Y-m-d"
        altInput: true
      });
    })
  };
}

export { initFlatpickr };
