// Theme toggle (will be enhanced on feature branch)
const toggleBtn = document.getElementById('themeToggle');
toggleBtn?.setAttribute('aria-pressed', 'false');

toggleBtn?.addEventListener('click', () => {
  const isNowDark = document.body.classList.toggle('dark');
  toggleBtn.setAttribute('aria-pressed', String(isNowDark));
  localStorage.setItem('prefersDark', isNowDark ? '1' : '0');
});

window.addEventListener('DOMContentLoaded', () => {
  if (localStorage.getItem('prefersDark') === '1') {
    document.body.classList.add('dark');
  }
});

// Simple contact form validation (base)
const form = document.getElementById('contactForm');
if (form) {
  const msg = document.getElementById('contactMsg');
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const message = document.getElementById('message').value.trim();
    if (!name || !email || !message) {
      msg.textContent = 'Please fill in all fields.';
      return;
    }
    // naive email regex
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      msg.textContent = 'Please enter a valid email.';
      return;
    }
    msg.textContent = 'Thanks — your message was recorded (demo).';
  });
}

const textarea = document.getElementById('message');
const charCount = document.getElementById('charCount');
if (textarea && charCount) {
  textarea.addEventListener('input', () => {
    charCount.textContent = `${textarea.value.length}/500`;
    if (textarea.value.length > 500) {
      textarea.value = textarea.value.slice(0, 500);
      charCount.textContent = `500/500`;
    }
  });
}
