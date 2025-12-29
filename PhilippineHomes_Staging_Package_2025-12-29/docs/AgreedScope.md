
# Philippine Homes — Agreed Scope (Staging)

**Date:** 2025-12-29 (GMT+4)

## Core decisions
- Reservation‑only platform. No on‑platform sales or escrow. Buyer and seller agree on an offer; then buyer pays the **reservation fee off‑platform** directly to the seller. The app records status and proof. (Sources: apartment sell.pdf, housing 2.pdf, final build.pdf)
- Roles & accounts: **CEO/Creator (Admin)**, **Seller**, **Buyer**. Buyer **must** create an account (email, name, mobile, password) to message or make offers. Seller verification = **ID‑only**. (Sources: housing 2.pdf)
- Payment options shown to buyers are **informational**; seller can accept/reject a chosen plan. Actual payments remain off‑platform. Seller sets the **reservation amount** per listing (percent or fixed PHP). (Sources: housing 2.pdf)
- **Reveal details**: after seller accepts an offer, the app sends a secure private message with seller payout details (bank/e‑wallet/QR Ph). Buyer clicks **Reveal details** (no OTP), sees full data for **15 minutes**, can **Copy** fields, pays off‑platform, uploads proof, seller confirms ⇒ **Reserved (Paid)**. (Sources: housing 2.pdf)
- Refund policy: **Non‑refundable by default**; seller can **Approve Refund** with a mandatory reason. The system records the decision; refund itself is off‑platform. (Sources: housing 2.pdf)
- **Featured/Boost**: paid through platform (sandbox on staging) with auto‑activation and auto‑expiry at **7/14/30 days**; intro rates agreed previously. Funds go directly to **CEO/Creator payout**. (Sources: apartment sell.pdf)
- **Display Ads module**: self‑serve banner/native ads; funds go to **CEO/Creator payout**; launch price card set lower + **automatic 20% discount for 3 months**, then auto‑revert to baseline. (Sources: final build.pdf)
- Domain: **philippinehomes.net** (staging planned at **https://staging.philippinehomes.net**). DNS CNAME for `staging` and `www`, A record for apex `@`. (Sources: apartment sell.pdf)

## CEO/Creator staging login (seed)
- Email (username): **ceo@philippinehomes.net**
- Temporary password: **PhilHomes!2025#ChangeOnFirstLogin**

Change both after first login in Account Settings.
