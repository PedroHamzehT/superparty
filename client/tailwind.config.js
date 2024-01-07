/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'primary-yellow': '#F5BA41',
        'secondary-yellow': '#F5D049',
        'third-yellow': '#F5E442',
        'primary-orange': '#F5A142',
        'secondary-orange': '#F58142',
      }
    },
  },
  plugins: [],
}

