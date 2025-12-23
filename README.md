# Solar Maps (static)

A zero-dependency static landing page for Solar Maps onboarding. Everything is plain HTML, CSS,
and a tiny JavaScript snippet so you never have to run `npm install`.

## Getting started

1. Edit [`config.js`](./config.js) and set your API key in `apiKey`.
2. Open [`index.html`](./index.html) directly in your browser, or serve the folder with any static server (e.g. `python -m http.server`).
3. Share the page or deploy the included `nginx` container if you want a ready-to-ship image.

## Files

- `index.html` — Landing page that reads the API key from `config.js` and displays helpful links.
- `styles.css` — Minimal styling for the static layout.
- `config.js` — Single place to store your client-facing API key.
- `Dockerfile` — Optional Nginx image to serve the static assets; no JavaScript tooling required.

## Docker (optional)

Build and run a lightweight container if you prefer a consistent environment:

```bash
docker build -t solar-maps-static .
docker run --rm -p 8080:80 solar-maps-static
```

Visit http://localhost:8080 to view the site.
