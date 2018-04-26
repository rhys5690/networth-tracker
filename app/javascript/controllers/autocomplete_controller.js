import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]

  autosuggest() {
    console.log(`lets make some magic!!`);
  }

  get name() {
    return this.nameTarget.value
  }
}
