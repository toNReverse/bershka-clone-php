# Bershka Clone – PHP

This project is a complete e-commerce web application inspired by the Bershka website.  
It is developed using pure **PHP**, **HTML**, **CSS**, and **JavaScript**, without any front-end or back-end frameworks.  
Originally created as part of a university exam, it has been refined to serve as a professional example of a fully functional, API-integrated e-commerce platform.

---

## Overview

The application replicates a modern fashion e-commerce experience with real-time product search, user authentication, cart and wishlist management, and checkout with Stripe integration.  
It includes both front-end and back-end logic, API integrations for translations, currency conversions, and product data retrieval, and a structured MySQL database.

---

## Features

### Frontend
- Fully responsive layout built with HTML5 and CSS3.
- Live product search with JavaScript and external API integration.
- Wishlist and cart management through Fetch API requests.
- Modal-based cart for instant preview and product removal.
- Login and registration pages with form validation.
- Dynamic interface inspired by the Bershka design language.

### Backend
- PHP-based REST endpoints to manage:
  - Wishlist and cart operations.
  - Product searches via external API.
  - Currency conversion and language translation.
  - Checkout creation and payment sessions.
- MySQL database integration for persistent user and product data.
- Secure payment system implemented via Stripe API.
- Clear separation between client-side logic, server-side scripts, and assets.

---

## Database Structure

Two SQL files are included in the repository:

- **`hw1.sql`** — Defines the base database structure and essential tables.  
- **`db.sql`** — Adds additional tables and relationships required for the full functionality (wishlist, cart, and user management).

After importing both files into MySQL, the database will include all necessary structures for authentication, product storage, and shopping cart features.

---

## Technologies Used

- **Frontend:** HTML5, CSS3, JavaScript (vanilla)
- **Backend:** PHP 8+
- **Database:** MySQL / MariaDB
- **Payment Processing:** Stripe API (test mode)
- **External APIs:**
  - MyMemory Translation API
  - ExchangeRate API
  - SerpAPI
- **Development Environment:** XAMPP (Apache, PHP, MySQL)

---
## Configuration

Before running the project, make sure to properly configure the API keys and parameters required for external features to work.

### API Keys

The project uses several external APIs for product search, automatic translation, currency conversion, and payment processing.  
All keys must be manually set within the corresponding PHP or JavaScript files, as indicated in the code.

#### 1. SerpAPI
- Used for product search functionality.  
- Requires a variable named `SERPAPI_KEY` containing your private API key.  
- You can obtain it by registering at [https://serpapi.com](https://serpapi.com).

#### 2. MyMemory Translation API
- Used to dynamically translate product names and descriptions.  
- Requires a variable `MYMEMORY_KEY` (optional, but recommended to avoid request limits).  
- Register at [https://mymemory.translated.net/doc/spec.php](https://mymemory.translated.net/doc/spec.php) to obtain your key.

#### 3. ExchangeRate API
- Used to convert product prices to the user’s selected currency.  
- Set the variable `EXCHANGERATE_KEY` with your personal API key.  
- You can obtain it from [https://www.exchangerate-api.com](https://www.exchangerate-api.com).

#### 4. Stripe
- Used to handle payment processing (in test mode).  
- Requires two keys:
  - `STRIPE_SECRET_KEY`
  - `STRIPE_PUBLIC_KEY`  
- Both are available in your Stripe dashboard at [https://dashboard.stripe.com/apikeys](https://dashboard.stripe.com/apikeys).

---
## License

This project is released under the **MIT License**.  
You are free to use, modify, and distribute the code for personal or commercial purposes, provided that proper credit is given to the original author.

> © 2025 Marco Sapienza  
> This project was originally developed as part of an academic coursework and later refined for portfolio presentation purposes.

For full license details, please refer to the [LICENSE](LICENSE) file included in this repository.
