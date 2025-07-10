document.addEventListener("DOMContentLoaded", function () {
    const button = document.querySelector(".checkout-button");
    if (!button) return;
  
    button.addEventListener("click", function (e) {
      e.preventDefault();
  
      fetch("create-checkout-session.php", {
        method: "POST"
      })
        .then((res) => res.json())
        .then((data) => {
          if (data.id) {
            const stripe = Stripe("pk_test_51RiHdmRspCzH4l9NL0Co7Y58T3jVKQoOEnLn2CbrLhbdKlMvD3uPgHKWg7AYdZpKVVY2JQJebcW40q9WcRh2wUYu00w9zO2lmh"); // CHIAVE PUBBLICA
            stripe.redirectToCheckout({ sessionId: data.id });
          } else {
            console.error("Errore lato server:", data.error || "Session ID mancante");
          }
        })
        .catch((error) => {
          console.error("Errore durante il pagamento:", error);
        });
    });
  });