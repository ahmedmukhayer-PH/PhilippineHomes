
# Philippine Homes — Staging Bundle (Reservation‑only)

This package contains docs, schema, API spec, and configuration to spin up **staging** for
**philippinehomes.net** quickly.

## What’s inside
- `docs/AgreedScope.md` — scope & rules
- `database/schema.sql` — PostgreSQL tables
- `api/openapi.json` — endpoints
- `ads/RateCard.md` — Display Ads pricing & promo
- `config/dns.txt` — DNS records for staging

## Quick start (local dev)
1. **Create DB**
   ```bash
   createdb philippine_homes
   psql philippine_homes -f database/schema.sql
   ```
2. **API & Web** — plug these specs into your framework (NestJS/Next.js).
   - Use `api/openapi.json` to scaffold controllers/services.
   - Seed CEO/Creator login: `ceo@philippinehomes.net` / `PhilHomes!2025#ChangeOnFirstLogin`.
3. **Run** your web (Next.js) and API locally, then deploy.

## Deploy (staging)
- **Front‑end**: Vercel (Next.js). Bind to `staging.philippinehomes.net`.
- **API**: Render/Fly.io/Azure App Service. Expose HTTPS, attach DB.
- **DNS**: see `config/dns.txt`. Wait for SSL; test.

## Acceptance checklist
- Buyer **must** have an account (email, name, mobile, password) before making offers.
- Offer → Seller **Accepts** → Secure Message **Reveal details** (no OTP; 15‑minute window; **Copy** enabled) → Buyer pays off‑platform → uploads **proof** → Seller **Confirms Paid** → **Reserved (Paid)**.
- Seller ID‑only verification.
- Non‑refundable reservation policy; **Approve Refund** (reason required) available to seller.
- Featured/Boost checkout (sandbox) auto‑activates; auto‑expires at 7/14/30 days; funds to CEO.
- Display Ads module live with intro pricing and 20% promo for 3 months.

## Notes
- Payments remain **off‑platform**; platform records status only.
- Payout details are shown **after acceptance** via secure message; masked by default; reveal on demand; audit logged.
