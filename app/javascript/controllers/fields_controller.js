import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "formItemOptions", "newButton"];

  connect() {
    this.check()
    console.log(this.newButtonTarget.classList)
  }

  check() {
    this.formItemOptionsTarget.classList.toggle(
      "hidden", this.selectTarget.value !== "dropdown"
    );
    this.newButtonTarget.classList.toggle(
      "hidden", this.selectTarget.value !== "dropdown"
    );
    this.newButtonTarget.classList.toggle(
      "inline-block", this.selectTarget.value === "dropdown"
    );
  }
}