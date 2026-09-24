```{=html}
<div class="resume-header">
<div class="rh-left">
<h1>Alejandro Echeverria</h1>
<div class="rh-title">Senior AI and Data Solutions Engineer</div>
</div>
<div class="rh-contact">
<a href="mailto:nablaservices@outlook.com">nablaservices@outlook.com</a><br>
<a href="https://linkedin.com/in/cuete">https://linkedin.com/in/cuete</a><br>
<a href="https://github.com/cuete">https://github.com/cuete</a>
</div>
</div>
```

```{=openxml}
<w:p><w:pPr><w:pStyle w:val="Heading1"/><w:spacing w:before="0" w:after="0"/></w:pPr><w:r><w:t>Alejandro Echeverria</w:t></w:r></w:p><w:p><w:pPr><w:spacing w:before="0" w:after="120"/></w:pPr><w:r><w:rPr><w:color w:val="595959"/></w:rPr><w:t>Senior AI and Data Solutions Engineer</w:t></w:r></w:p><w:p><w:pPr><w:spacing w:before="0" w:after="0"/></w:pPr><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "mailto:nablaservices@outlook.com" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>nablaservices@outlook.com</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r><w:r><w:t xml:space="preserve">  |  </w:t></w:r><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "https://linkedin.com/in/cuete" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>linkedin.com/in/cuete</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r><w:r><w:t xml:space="preserve">  |  </w:t></w:r><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "https://github.com/cuete" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>github.com/cuete</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r></w:p>
```

## Professional Summary

Senior Engineer with 10+ years of experience in AI and ML systems and 18+ years across data and software engineering. Designs and deploys production-ready AI pipelines, data platforms, and decision-support tools, embedding with domain experts to translate ambiguous business and research requirements into scalable, secure, and measurable outcomes across the full lifecycle: from proof-of-concept to high-scale production, from infrastructure to visualization, from requirements to maintenance. Owns technical architecture and mentors engineering teams through ambiguous, fast-moving problem spaces. Experience spans global health research, healthcare, customer support, and enterprise software.

## Technical Skills

**AI & ML:** LLMs, AI agents and multi-agent systems (supervisor orchestration), agentic BI, RAG, NLP, MLOps; OpenAI and Anthropic Claude SDKs, Azure AI Foundry, LangChain, LangGraph, Databricks; hybrid search (vector + BM25/RRF), embeddings, knowledge graphs, document ingestion and OCR; model selection, evaluation, A/B testing, and LLM-based quality scoring; prompt, context, and token optimization (FinOps for AI); Responsible AI and guardrails; AI-assisted development (Claude Code, GitHub Copilot, Codex).

**Data & Cloud:** Azure (Data Factory, Synapse, Analysis Services, Data Lake, Event Hub, Service Bus, Event Grid, Cosmos DB, AI Search, Container Apps, Blob Storage), Microsoft Fabric; PostgreSQL, SQLite, Redis, pgvector, sqlite-vec; ETL/ELT, data modeling.

**Languages & Frameworks:** Python, C#, TypeScript, JavaScript, React, R, SQL, PowerShell; .NET, Node.js, FastAPI.

**Infrastructure & DevOps:** Docker, Kubernetes; Azure DevOps, GitHub Actions, Drone; Terraform, Bicep, ARM; REST APIs, async/parallel pipelines, caching for AI services.

**Architecture & Security:** Solutions architecture, design patterns, algorithmic complexity and performance optimization at scale; threat modeling, SDL, Zero Trust, firewalls, subnetting, OAuth 2.0, SAML, SSO; GDPR, CCPA, HIPAA.

## Soft Skills

**Leadership:** Technical strategy ownership in ambiguous problem spaces; cross-functional alignment from engineering to executive stakeholders; mentorship and technical leveling of engineering teams; recovering at-risk cross-functional projects by resolving disconnects between technical teams and domain experts.

**Communication:** Translating technical tradeoffs into clear recommendations for non-technical decision-makers; trusted advisor role in AI adoption for regulated domains; rapidly acquiring domain knowledge (customer support, epidemiology, global health) and translating it into production requirements.

**Professional:** Security-first mindset; responsible AI and data privacy focus; bias toward measurable outcomes over process.

## Personal Projects

### Legal Document Intelligence System
*2025 - Current*

- Built a production RAG pipeline for legal document classification and analysis: multi-format extraction (PDF, DOCX, EML, JPG, XLSX, OCR), recursive chunking, and sentence-transformers embeddings; chunk-level retrieval scored 13% higher precision than single-doc embeddings at sub-200ms query latency.
- Implemented lexical (SQLite FTS5, BM25 ranking) and semantic (sqlite-vec) search over two knowledge bases (~4,400 case documents and ~1,400 statutes and court rules), with metadata filters (file type, category, date range) and minimum-score thresholds to ground agent answers in retrieved sources.
- Designed a multi-agent assistant with supervisor orchestration, routing tasks to specialized tool-augmented agents (code, legal, research) by type and cost; async delegation maps to interrupt/resume.

### Semantic Analysis Platform
*2026 - Current*

- Built a full-stack document intelligence platform (FastAPI + React) for multi-source ingestion, semantic chunking, and concept-graph extraction/merging; includes a fact-check feature that verifies claims via Perplexity and feeds results into a document quality score, with three synchronized views (concept map, chat, document).

### Shared Agent Context Store
*2026 - Current*

- Building a single context store that AI agents across different clients and devices read and write through one remote MCP server, replacing separate per-tool memory files that had drifted out of sync; deployed on Azure Container Apps (scale-to-zero) with SQLite storage, lexical, fuzzy, and semantic search, token authentication, and encryption for sensitive data.

## Professional Experience

### Senior Software Engineer (Data and Statistical Modeling) - Gates Foundation
*2025 - 2026*  
*Seattle, WA*

- Architected AI-powered epidemiology dashboards for national malaria eradication programs in Nigeria, Senegal, and Benin; surfaced disease indicators, intervention cost-effectiveness, and scenario simulations used by health ministries to drive policy decisions.
- Built a RAG-based agentic BI pipeline (Anthropic and OpenAI SDKs) that ingested raw epidemiology data and converted it into decision-support analyses and interactive, PostgreSQL-backed visualizations through a conversational interface for public health researchers and partner institutions.
- Applied production AI practices across the full pipeline: data quality controls, privacy-by-design, prompt engineering, evaluation pipelines, and DevSecOps for global health research environments.
- Led cross-functional technical planning across research, engineering, and operations; translated epidemiology requirements into production AI systems adopted by partner institutions.
- Took over a stalled Nigeria health facility budget analysis pipeline mid-project, embedding with public health researchers to reconcile a disconnect between the pipeline's technical capabilities and the analysis methodology; designed a retrofit plan aligned to the available data and brought the project back on schedule.

### Senior AI Solutions Consultant - Dura Digital
*2025 - Current*  
*Seattle, WA*

- Provided architectural direction and implementation strategy for healthcare and financial organizations adopting ML/AI tooling and infrastructure; serving as trusted technical advisor during early AI adoption phases.
- Identified key constraints and designed implementation roadmaps to bridge gaps between existing infrastructure and planned AI-focused architectures, enabling clients to move from strategy to production with clear milestones.
- Delivered secure, scalable, and compliant AI solutions for workflow automation, translating ambiguous business requirements into actionable technical plans with measurable outcomes.

### Software Engineer II - Microsoft (Customer Experience)
*2019 - 2025*  
*Redmond, WA*

- Designed and shipped frontier ML/AI speech-to-text systems for enterprise customer support, reducing agent oversight overhead by 50% through intelligent automation and real-time AI assistance with KB retrieval.
- Built real-time and post-call customer satisfaction metric pipelines and visualization tools, enabling live supervisor awareness and KPI rollup evaluation across global support operations.
- Architected and delivered large-scale cloud-native enterprise applications and event-streaming pipelines using Azure infrastructure (Data Factory, Event Hub, Service Bus, Event Grid, Data Lake, Cosmos DB), DevOps practices, and CI/CD automation.
- Conducted threat modeling and implemented zero-trust security strategies to protect critical services and sensitive customer data; managed incident response for high-priority production outages.

### Software Engineer - Motiv Inc. (Microsoft Contract)
*2017 - 2019*  
*Redmond, WA*

- Built secure, high-throughput NLP ML cloud applications at Microsoft's Core Platform Engineering Group: APIs and microservices, vulnerability mitigation, data privacy compliance, DevOps, and security hardening.

### Software Engineer - Getty Images
*2012 - 2017*  
*Seattle, WA*

- Developed and tested web services and databases for financial data processing and royalty calculations: .NET, relational databases, message brokers, monitoring platforms, CI/CD, and on-call engineering support.

### Software Engineer in Test - iSoftStone Inc.
*2007 - 2012*  
*Kirkland, WA*

Designed and executed automated test suites for web, mobile, and desktop products at Fortune 100 technology clients. Built unit and integration test frameworks, wrote test plans, and led offshore and on-site QA teams.

## Education

### Bachelor of Science in Electronics Engineering

Universidad del Valle de Guatemala

## Certifications

- Agile Project Management, Google
- Azure Security Engineer Associate, Microsoft
- Solutions Architecture, University of Washington
- Telecommunications and Networks, America Movil
