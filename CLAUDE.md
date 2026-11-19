# CLAUDE.md — PetrIA-RAG

## Project
PetrIA is a map of the Vaca Muerta wells (Argentina) with a heat map of
*expected* productivity in undrilled areas, plus an AI assistant that answers
questions by citing official data.

PetrIA does **not** discover oil: seismic data is not public. It estimates
expected productivity from existing wells. The UI says so, and states that it
is not drilling or investment advice.

## Repositories
| Repo | Role |
|---|---|
| [PetrIA](https://github.com/Toti-Gauna/PetrIA) | Web (Next.js + MapLibre), docs, History, local infra |
| [PetrIA-BE](https://github.com/Toti-Gauna/PetrIA-BE) | Java platform API (Spring Boot, Keycloak, multi-tenant) |
| [PetrIA-RAG](https://github.com/Toti-Gauna/PetrIA-RAG) | AI assistant (FastAPI, LangGraph, RAG) |
| [PetrIA-Ingest](https://github.com/Toti-Gauna/PetrIA-Ingest) | Data pipeline (ETL into PostGIS, RabbitMQ) |
| [PetrIA-ML](https://github.com/Toti-Gauna/PetrIA-ML) | Detector (LightGBM quantile regression) |

## Working agreement
- Build-to-learn: Claude writes the code; the developer directs, asks
  questions, breaks things and decides. Nothing moves forward unless the
  developer could explain it.
- Before building a piece, explain what it is and why we need it. For
  important decisions, propose two options and wait for the choice.
- Work in small steps. After each one show: files changed, key code, and the
  command to run it.
- After each module: 1 to 3 "break it" experiments (the developer predicts the
  result first), then the developer explains the module back.
- If a proposal is bad, say so and explain why. Do not agree by default.
- Everything is in English: code, commits, docs and conversation. End each
  reply with a short "English corner" that coaches the developer's English.

## Rules
- These repositories are **public**. Never commit secrets, personal data or
  employer details, in code or in history. Use environment variables and a
  `.env.example` with names only.
- Never invent data. If something does not exist or is dirty, document it.
- Important decisions become short ADRs in `PetrIA/docs/adr`.
- Never push to `main`. Work on the branch the session names. Open pull
  requests only when asked.
- Commits: English, conventional style (`feat:`, `fix:`, `docs:`).
- Each working session updates `PetrIA/History/Day-XX-...`.

## This repo: PetrIA-RAG
Python + FastAPI + LangGraph on Claude; the model comes from an environment
variable. Tools: read-only SQL with an allowlist, detector lookup, operator
comparison. RAG over methodology and regulation documents with pgvector.
- Owns schema `rag` (document chunks and embeddings).
- Reads schema `geo` through a read-only database role.
- Cites the data or source; abstains when there is no evidence.
- 40 to 60 reference questions as evals; traces with cost per call; a monthly
  spending cap enforced in code.
- Stage 6.
