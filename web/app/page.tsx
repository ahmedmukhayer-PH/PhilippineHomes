import Link from 'next/link';

export default function Page() {
  return (
    <main style={{ padding: 24, maxWidth: 960, margin: '0 auto', lineHeight: 1.6 }}>
      <header style={{ marginBottom: 24, borderBottom: '1px solid #eee', paddingBottom: 12 }}>
        <h1 style={{ margin: 0 }}>Philippine Homes — Staging</h1>
        <small>Reservation‑only platform MVP</small>
      </header>

      <p>
        Reservation‑only flow: Buyer makes offer → Seller accepts → Secure Message →{' '}
        <strong>Reveal payment details</strong> (no OTP, copy enabled) → Buyer uploads{' '}
        <strong>proof</strong> → Seller <strong>Confirm Paid</strong>.
      </p>

      <section style={{ marginTop: 24 }}>
        <h2>Quick links</h2>
        <ul style={{ listStyle: 'none', padding: 0 }}>
          <li><Link href="/login">/login</Link></li>
          <li><Link href="/buyer">/buyer</Link></li>
          <li><Link href="/seller">/seller</Link></li>
        </ul>
      </section>
    </main>
  );
}