import { Controller } from "stimulus";

const END_POINT = 'https://sandbox.tradier.com/v1/markets/search?q=google';

export default class extends Controller {
  static targets = [ "input" ];

  connect() {
    this.stockNames = [];
    fetch(END_POINT)
      .then(response => {
        return response.json();
      })
      .then(s => {
        debugger;
      });
  }

  autosuggest() {
    console.log(this.inputValue);
  }

  get inputValue() {
    return this.inputTarget.value;
  }
}
