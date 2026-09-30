# TriMet Data Pipeline

A static project case study for Spring 2026 data engineering project. Uses the final presentation's visual direction and statistics, the three implementation notebooks, and saved SQL visualization outputs.

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
