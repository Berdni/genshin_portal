import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "label", "input" ]

  focus() {
    this.labelTarget.classList.add('field__label_active')
  }

  blur() {
    if (this.inputTarget.value) return;

    this.labelTarget.classList.remove('field__label_active')
  }
}
