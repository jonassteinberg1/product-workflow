# Evolution: 1-Discovery Phase

> How we evolved the discovery phase from templates to automation

---

## Key Insight

The discovery phase templates (COMPETITIVE_ANALYSIS.md, PROBLEM_STATEMENT.md, USER_RESEARCH.md) were designed as documentation artifacts to be filled manually. We realized that for a data-driven product, **discovery itself requires development** - automating the collection and analysis of competitive intelligence.

---

## Evolution Steps

### 1. Identify Data Sources
- Determined what external data would inform the discovery templates
- For this product: competitor websites (4 CRMs) + YouTube comparison video
- **Generalizable**: Every discovery phase should identify 2-3 primary data sources

### 2. Define the Analysis Pipeline
- Mapped data sources → analysis steps → template outputs
- Created a flow: Collection → Extraction → Analysis → Correlation → Synthesis
- **Generalizable**: Discovery pipelines follow ETL patterns (Extract, Transform, Load into templates)

### 3. Choose Infrastructure First
- Selected Docker + docker-compose before writing any feature code
- Defined all services upfront (transcriber, scraper, analyzers, viz, test)
- **Generalizable**: Containerized infrastructure ensures reproducibility and isolates dependencies

### 4. Break Down Into Beads
- Decomposed the pipeline into 8 atomic tasks (beads 000-007)
- Each bead had: objective, acceptance criteria, test commands, files to create
- Dependencies mapped between beads
- **Generalizable**: Beads should be completable in 1-2 hours with clear "done" criteria

### 5. Write Tests Before Features (TDD)
- Created test files for each component before implementation
- Tests defined the contract each module must fulfill
- Unit tests for structure, E2E tests for integration
- **Generalizable**: Tests are the specification; implementation follows

### 6. Implement Data Collection Layer
- Built components to gather raw data (transcriber, scraper)
- Handled external API limits (chunking for Whisper, timeouts for scrapers)
- Cached results to avoid re-fetching
- **Generalizable**: Collection components should be idempotent with caching

### 7. Implement Analysis Layer
- Used LLM (Claude) to extract structure from raw data
- Separate analyzers for different concerns (features, pricing, correlation)
- Each analyzer outputs JSON for downstream consumption
- **Generalizable**: LLM analysis works best with focused prompts and structured output

### 8. Implement Synthesis Layer
- Final analyzer combines all previous outputs
- Populates the discovery templates with real data
- Transforms JSON → Markdown for human consumption
- **Generalizable**: Synthesis bridges automated analysis to human-readable artifacts

### 9. Add Visualization
- Streamlit dashboard for interactive exploration
- Reads from analysis JSON files
- Provides different views (features, pricing, insights)
- **Generalizable**: Visualization is optional but helps validate analysis before committing to templates

### 10. Create Execution Script
- Ralph-loop script with clear completion promise
- Specifies exact commands to run
- Defines what "done" looks like
- **Generalizable**: Every phase should have a runnable script that produces its artifacts

---

## What Changed in the Template

| Before | After |
|--------|-------|
| 3 empty template .md files | 3 template .md files + full automation pipeline |
| Manual research required | Automated data collection |
| Subjective analysis | LLM-driven structured analysis |
| No tests | 23 tests covering all components |
| No execution path | ralph-loop script with beads |

---

## Lessons for Future Products

1. **Templates are outputs, not inputs** - The discovery templates get populated BY the pipeline, not filled manually

2. **Infrastructure is bead 000** - Always start with Docker/environment setup before any feature work

3. **External data needs adaptation** - APIs have limits, websites block scrapers, videos need auth; plan for workarounds

4. **Beads should be small** - If a bead takes more than 2 hours, split it

5. **Completion promise is critical** - Ralph needs explicit criteria for when the phase is "done"

6. **Cache everything** - Re-running the pipeline should be fast; only re-process when forced

---

## Files Created

```
templates/1-discovery/
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── .env / .env.example
├── run-ralph.sh
├── beads/
│   └── 000-007.md (8 bead files)
├── src/
│   ├── transcriber/
│   ├── scraper/
│   ├── analyzers/
│   ├── visualization/
│   ├── correlator.py
│   ├── final_analyzer.py
│   └── pipeline.py
├── tests/
│   └── 5 test files
└── data/
    ├── transcripts/
    ├── scraped/
    └── analysis/
```

---

## Time Investment

| Activity | Approximate Time |
|----------|-----------------|
| Planning & architecture | 30 min |
| Docker infrastructure | 15 min |
| Data collection (transcriber, scraper) | 45 min |
| LLM analyzers | 30 min |
| Correlation & synthesis | 30 min |
| Visualization | 20 min |
| Tests | 30 min |
| Beads + ralph script | 20 min |
| Debugging & fixes | 30 min |
| **Total** | **~4 hours** |

---

## Next Evolution

When starting a new product from product-workflow template:

1. Clone template
2. Read this evolution doc
3. Identify YOUR data sources for discovery
4. Adapt the pipeline pattern to your sources
5. Reuse the Docker/beads structure
6. Customize analyzers for your domain
