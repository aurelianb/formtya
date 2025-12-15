import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"];

  remove() {
    this.fieldTarget.value = "1";
    this.fieldTarget.closest('.remove-div').classList.toggle("hidden")
  }
}