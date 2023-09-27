import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let script = document.createElement('script');
    script.src = "https://assets.calendly.com/assets/external/widget.js";
    script.async = true;
    document.body.appendChild(script);

    script.onload = function() {
      Calendly.initBadgeWidget({
        url: 'https://calendly.com/victor_barbosa/30min?primary_color=1a7f5f',
        text: 'Schedule a call with me!',
        color: '#1a7f5f',
        textColor: '#ffffff',
        branding: true
      });
    }
  }

  disconnect() {
    Calendly.destroyBadgeWidget();
  }
}
