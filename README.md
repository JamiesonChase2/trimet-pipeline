# TriMet Data Pipeline

A static project case study for Chase Jamieson's Spring 2026 data engineering project. Uses the final presentation's visual direction and statistics, the three implementation notebooks, and saved SQL visualization outputs.

## Preview

Open `index.html` directly in a browser. No server, build, package installation, database, API key, or JavaScript is needed. All site images and results are local assets. External links are limited to author contact/profile, map attribution, and documentation.

## Publish on GitHub Pages

1. Create a repository, for example `trimet-pipeline`.
2. Commit this folder's **contents** to the repository root, with `index.html`, `styles.css`, `.nojekyll`, and `assets/` alongside one another. Do not upload the surrounding resume folder or raw notebooks.
3. In the repository, open **Settings > Pages**.
4. Set **Source** to **Deploy from a branch**, choose **main** and **/(root)**, and save.
5. Once deployment completes, use the URL shown in Settings > Pages as the resume link.

For the example repository name, the expected URL would be `https://jamiesonchase2.github.io/trimet-pipeline/`. This is an example, not a currently deployed site.

All asset links are relative and work under a GitHub Pages repository subpath.

Official instructions: [Configure a GitHub Pages publishing source](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

## Content and provenance

- `index.html`: narrative, chart values, labels, and accessible native disclosures.
- `styles.css`: responsive layout, cyan/periwinkle accents, and print styles.
- `assets/presentation.pdf`: original final presentation.
- `assets/architecture.webp`: a full render of presentation slide 4, preserving its overlaid diagram annotations.
- `assets/routes.webp`, `morning.webp`, `midday.webp`, `afternoon.webp`: static exports of the saved Folium results from `Pesentation_visuals.ipynb`. Original data and visual encodings are retained. The obsolete CARTO basemap was replaced with OpenStreetMap; attribution is included.
- `assets/analysis.sql`: two selected analysis queries without connection setup or credentials.
- `assets/results.json`: reported values and measurement definitions.
- `SOURCES.md`: exact source mapping and scope notes.

Raw notebooks are intentionally excluded because they contain database connection details. No live database connections are made by this site.

Update both `index.html` and `assets/results.json` when changing reported values; the page does not fetch the JSON at runtime.
