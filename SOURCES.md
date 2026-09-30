# Source mapping

The page describes a course project using historical TriMet observations. It does not claim employment by TriMet, live data, whole-fleet coverage, or production-grade reliability.

| Content | Source |
| --- | --- |
| Course, author, presentation style | `dataeng_final.pdf`, slide 1 |
| Architecture illustration | `dataeng_final.pdf`, slide 4 |
| Final dataset sizes, service days, weekday/weekend averages | `dataeng_final.pdf`, slide 5 |
| Memory constraints, backup coverage, missing alerts, proposed natural-language interface | `dataeng_final.pdf`, slide 7 |
| Three regional VMs, Pub/Sub services, cron/systemd configuration | `Project_Part1_Chase_Jamieson (1).ipynb`, cells 9-31 |
| Staging, 25,000-row GPS batches, SQL window functions, validation | `Project_Part2_Chase_Jamieson.ipynb`, cells 12, 18, 26, 35, 37 |
| Intermediate 3,426,130-row total | `Project_Part2_Chase_Jamieson.ipynb`, cells 38 and 40; not substituted for the later presentation totals |
| HTML StopEvent ingestion, transformations, loading | `Project_Part3_Chase_Jamieson.ipynb`, cells 9, 13, 15, 16 |
| Route 51 query and time-period means | `Pesentation_visuals.ipynb`, cells 3 and 7 |
| Route 51 shared path overlays | `Pesentation_visuals.ipynb`, cells 4-7; 20 observed paths reused across periods |
| Selected trip boardings and maps | `Pesentation_visuals.ipynb`, cells 9-10 |

## Analytical qualifications

- Final totals: 14,369,896 GPS records + 1,079,671 stop events = 15,449,567 records. These later presentation values are not a live database query.
- The weekday/weekend GPS ratio is 820,727 / 411,799 = approximately 1.99, rounded to 2.0. The page does not interpret this as a passenger-demand ratio.
- Lateness figures are the unweighted means of stop-level average delays, not event-weighted or passenger-weighted averages. The displayed stop counts are 78, 34, and 78.
- Time-period bins use the hour of scheduled stop time. “Afternoon / night” is the `ELSE` branch and includes early-morning hours before 05:00.
- The lateness query excludes missing locations, missing times, and absolute deviations exceeding 60 minutes. It allows stop-period groups with a single observation.
- The top-five query chooses the highest-boarding trip per route among trips with GPS records. It joins to distinct trip IDs to avoid multiplying stop-event rows by GPS records. Boardings are not unique riders.
- No cross-route “most delayed” claim is made: the supplied visualization notebook selects Route 51 but does not include the route-ranking query that motivated that selection.
- Run IDs and count sentinels help handle out-of-order messages. They do not by themselves establish duplicate-safe, exactly-once, or crash-safe processing.

## Public artifacts

The PDF and exported map results are provided as evidence. Notebook instructions are not site instructions. Connection code, credentials, infrastructure addresses, and raw notebooks are not included in the public folder.

Basemap data is copyright OpenStreetMap contributors: https://www.openstreetmap.org/copyright. The saved map paths and markers come from the user's supplied SQL outputs.
