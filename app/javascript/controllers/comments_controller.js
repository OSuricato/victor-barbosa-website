import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "section" ]

  toggle() {
    if (this.sectionTarget.style.display === 'none') {
      this.sectionTarget.style.display = 'block';
    } else {
      this.sectionTarget.style.display = 'none';
    }
  }
}
