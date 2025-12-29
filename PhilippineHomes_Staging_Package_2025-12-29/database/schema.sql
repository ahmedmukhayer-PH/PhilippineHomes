
-- PostgreSQL schema (reservation-only)
CREATE TABLE IF NOT EXISTS admins (
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  role TEXT NOT NULL CHECK (role IN ('buyer','seller')),
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  mobile TEXT NOT NULL,
  password_hash TEXT,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS seller_verifications (
  id SERIAL PRIMARY KEY,
  seller_id INT REFERENCES users(id),
  gov_id_file TEXT,
  status TEXT NOT NULL CHECK (status IN ('pending','verified','rejected')),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS payout_profiles (
  id SERIAL PRIMARY KEY,
  seller_id INT REFERENCES users(id),
  bank_name TEXT,
  account_name TEXT,
  account_number TEXT, -- store encrypted
  ewallet_gcash TEXT,
  ewallet_maya TEXT,
  qrph_image TEXT,
  updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS listings (
  id SERIAL PRIMARY KEY,
  seller_id INT REFERENCES users(id),
  title TEXT NOT NULL,
  description TEXT,
  price_php BIGINT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('active','reserved')) DEFAULT 'active',
  reservation_type TEXT CHECK (reservation_type IN ('percentage','fixed')),
  reservation_value BIGINT, -- if percentage, store % * 100 (e.g., 1000 for 10.00%) else PHP amount
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS listing_media (
  id SERIAL PRIMARY KEY,
  listing_id INT REFERENCES listings(id) ON DELETE CASCADE,
  kind TEXT CHECK (kind IN ('photo','video')),
  url TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS offers (
  id SERIAL PRIMARY KEY,
  listing_id INT REFERENCES listings(id),
  buyer_id INT REFERENCES users(id),
  amount_php BIGINT NOT NULL,
  preferred_plan TEXT,
  status TEXT NOT NULL CHECK (status IN ('pending','accepted','rejected')) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS secure_messages (
  id SERIAL PRIMARY KEY,
  offer_id INT REFERENCES offers(id),
  type TEXT NOT NULL, -- 'reservation_payout_details'
  masked_payload JSONB NOT NULL,
  reveal_window_minutes INT DEFAULT 15,
  status TEXT NOT NULL CHECK (status IN ('unread','read','revealed')) DEFAULT 'unread',
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS reveal_audits (
  id SERIAL PRIMARY KEY,
  message_id INT REFERENCES secure_messages(id),
  actor_id INT REFERENCES users(id),
  action TEXT NOT NULL, -- 'reveal' or 'copy'
  field TEXT,
  ip TEXT,
  user_agent TEXT,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS reservations (
  id SERIAL PRIMARY KEY,
  offer_id INT REFERENCES offers(id),
  listing_id INT REFERENCES listings(id),
  buyer_id INT REFERENCES users(id),
  seller_id INT REFERENCES users(id),
  reservation_amount_php BIGINT NOT NULL,
  payment_status TEXT NOT NULL CHECK (payment_status IN ('unpaid','buyer_reported','paid_confirmed','refund_approved')) DEFAULT 'unpaid',
  payment_proof_file TEXT,
  reserved_until DATE,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS refunds (
  id SERIAL PRIMARY KEY,
  reservation_id INT REFERENCES reservations(id),
  decided_by INT REFERENCES users(id),
  decision TEXT NOT NULL CHECK (decision IN ('approved','denied')),
  reason TEXT,
  decided_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS ad_placements (
  id SERIAL PRIMARY KEY,
  slot TEXT NOT NULL, -- leaderboard/mpu/halfpage/mobile/native
  duration_days INT NOT NULL,
  price_php INT NOT NULL,
  cpm_php INT,
  active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS ad_campaigns (
  id SERIAL PRIMARY KEY,
  advertiser_name TEXT,
  advertiser_email TEXT,
  slot TEXT,
  term_days INT,
  start_date DATE,
  end_date DATE,
  status TEXT CHECK (status IN ('active','paused','expired')) DEFAULT 'active'
);
