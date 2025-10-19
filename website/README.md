# Dotfiles Website

This directory contains the professional website for the dotfiles project, designed to be published to GitHub Pages.

## Features

- 🎨 Modern dark-themed design
- 📱 Fully responsive layout
- ⚡ Fast and lightweight (no build process needed)
- 🚀 Easy deployment to GitHub Pages

## Local Development

To preview the website locally:

```bash
npm run serve
```

Then open http://localhost:8000 in your browser.

## Deployment to GitHub Pages

1. Make sure you have committed all changes to the website files
2. Run the deployment command:

```bash
npm run deploy
```

This will:
- Build a deployment from the current directory
- Push to the `gh-pages` branch
- Make the website available at: `https://<username>.github.io/dotfiles/`

## File Structure

```
website/
├── index.html      # Main HTML file
├── styles.css      # Styling
├── package.json    # Node.js configuration with gh-pages
└── README.md       # This file
```

## Customization

### Update Links
Make sure to update the GitHub repository links in `index.html` if you fork this project:
- Navigation GitHub link
- Hero section buttons
- Footer links

### Styling
All styles are in `styles.css` with CSS custom properties (variables) at the top for easy theming:
- `--bg-primary`: Main background color
- `--accent-primary`: Primary accent color
- `--text-primary`: Main text color
- etc.

## Technologies Used

- Pure HTML5 and CSS3
- CSS Grid and Flexbox for layout
- CSS Custom Properties for theming
- `gh-pages` npm module for deployment

## Support

If you find this project helpful, consider supporting its development:

<script type="text/javascript" src="https://cdnjs.buymeacoffee.com/1.0.0/button.prod.min.js" data-name="bmc-button" data-slug="klee1611" data-color="#FFDD00" data-emoji=""  data-font="Bree" data-text="Buy me a coffee" data-outline-color="#000000" data-font-color="#000000" data-coffee-color="#ffffff" ></script>

Or visit: https://www.buymeacoffee.com/klee1611

## License

MIT
