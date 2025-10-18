// Theme toggle (will be enhanced on feature branch)
const toggle = document.getElementById('themeToggle');
toggle?.addEventListener('click', () => {
  document.body.classList.toggle('dark');
  const isDark = document.body.classList.contains('dark');
  localStorage.setItem('prefersDark', isDark ? '1' : '0');
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
