# PetrIA-RAG

The PetrIA assistant: answers questions about Vaca Muerta by citing official data, and abstains when there is no evidence.

Part of **[PetrIA](https://github.com/Toti-Gauna/PetrIA)**: a map of the Vaca
Muerta wells with a heat map of expected productivity, plus an AI assistant.
PetrIA estimates productivity from existing wells. It does not discover oil,
and it is not drilling or investment advice.

## Status
Planned: Stage 6. Nothing is implemented yet.

## Planned stack
Python, FastAPI, LangGraph, Claude API, pgvector

## Documentation
Architecture, decisions (ADRs) and the daily build log live in the
[PetrIA](https://github.com/Toti-Gauna/PetrIA) repository:
[docs](https://github.com/Toti-Gauna/PetrIA/tree/main/docs) and
[History](https://github.com/Toti-Gauna/PetrIA/tree/main/History).

## Configuration
Copy `.env.example` to `.env` and fill in the values. Never commit `.env`.
