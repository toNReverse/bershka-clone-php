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
            const stripe = Stripe("pk_test_TUA_CHIAVE_PUBBLICA"); // CHIAVE PUBBLICA
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