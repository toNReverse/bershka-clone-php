document.addEventListener('DOMContentLoaded', () => {
  
  fetch('load-favorites.php')
    .then(response => response.json()) 
    .then(json => {
      const container = document.getElementById('wl-favorites-container');

      if (json.length === 0) {
        container.innerHTML = "<p>Nessun prodotto nei preferiti.</p>";
        return;
      }

      json.forEach(product => {
        const card = document.createElement('div');
        card.classList.add('wl-card');

        card.innerHTML = `
          <div class="wl-image-wrapper">
            <img src="${product.thumbnail}" alt="${product.title}" class="wl-product-image" />
          </div>
          <div class="wl-info">
            <div class="wl-name">${product.title}</div>
            <div class="wl-price-heart">
              <div class="wl-price">${parseFloat(product.price).toFixed(2)} €</div>
              <img src="img/filled-hearth-search-page.png" alt="Cuore" class="wl-heart" data-id="${product.id}" />
            </div>
          </div>
        `;

        container.appendChild(card);
      });

      const hearts = document.querySelectorAll('.wl-heart');
      hearts.forEach(heart => {
        heart.addEventListener('click', () => {
          const id = heart.getAttribute('data-id'); // Ottiene l'id del prodotto
          removeFavorite(id); // Rimuove il prodotto dal database

          heart.closest('.wl-card').remove();

          if (container.children.length === 0) {
            container.innerHTML = "<p>Non hai più preferiti.</p>";
          }
        });
      });

    })
    .catch(error => {
      console.error('Errore nel caricamento dei preferiti:', error);
    });
});

function removeFavorite(id) {
  fetch("remove-wishlist.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" }, // Specifica il tipo di contenuto
    body: JSON.stringify({ id }), // Invia l'ID del prodotto in formato JSON
  })
  .then(r => r.json()) // Converte la risposta
  .then(data => {
    if (!data.ok) alert("Errore nella rimozione: " + (data.error || "sconosciuto"));
  })
  .catch(() => alert("Errore nella rimozione"));
}