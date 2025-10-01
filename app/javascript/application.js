// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:before-fetch-response", async (event) => {
  const response = event.detail.fetchResponse;

  if (response.status === 403) {
    try {
      const data = await response.responseText;
      const json = JSON.parse(data);
      showToast(json.error || "Você não pode acessar esta página");
    } catch {
      showToast("Você não pode acessar esta página");
    }
    event.preventDefault(); // cancela navegação
  }
});
