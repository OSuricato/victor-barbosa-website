import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "display", "form" ]

  connect() {
    this.displayTarget.style.display = 'block';
    this.formTarget.style.display = 'none';
  }

  edit(e) {
    e.preventDefault();
    this.displayTarget.style.display = 'none';
    this.formTarget.style.display = 'block';
  }
}
