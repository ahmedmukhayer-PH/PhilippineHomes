export default function Page() {
  return (
    <main style={{ padding: 24, maxWidth: 960, margin: '0 auto' }}>
      <h1>Philippine Homes — Staging</h1>
      <p>
        Reservation‑only flow: Buyer makes offer → Seller accepts → Secure Message →
        <strong> Reveal payment details</strong> (no OTP, copy enabled) →
        Buyer uploads <strong>proof</strong> → Seller <strong>Confirm Paid</strong>.
      </p>

      <section style={{ marginTop: 24 }}>
        <h2>Quick links</h2>
        <ul>
          <li><a href="/login">/login</a></li>
          <li><a href="/buyer">/buyer</a></li>
          <li><a href="/seller">/seller</a></li>
        </ul>
      </section>
    </main>
  );
}