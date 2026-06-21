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
<w:p><w:pPr><w:pStyle w:val="Heading1"/><w:spacing w:before="0" w:after="0"/></w:pPr><w:r><w:t>Alejandro Echeverria</w:t></w:r></w:p><w:p><w:pPr><w:spacing w:before="0" w:after="120"/></w:pPr><w:r><w:rPr><w:color w:val="595959"/></w:rPr><w:t>Senior Data and AI Solutions Engineer</w:t></w:r></w:p><w:p><w:pPr><w:spacing w:before="0" w:after="0"/></w:pPr><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "mailto:nablaservices@outlook.com" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>nablaservices@outlook.com</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r><w:r><w:t xml:space="preserve">  |  </w:t></w:r><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "https://linkedin.com/in/cuete" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>linkedin.com/in/cuete</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r><w:r><w:t xml:space="preserve">  |  </w:t></w:r><w:r><w:fldChar w:fldCharType="begin"/></w:r><w:r><w:instrText xml:space="preserve"> HYPERLINK "https://github.com/cuete" </w:instrText></w:r><w:r><w:fldChar w:fldCharType="separate"/></w:r><w:r><w:rPr><w:rStyle w:val="Hyperlink"/></w:rPr><w:t>github.com/cuete</w:t></w:r><w:r><w:fldChar w:fldCharType="end"/></w:r></w:p>
```

## Professional Summary

Senior Software Engineer with 18+ years of experience across, AI systems, data engineering, and cloud-native software. I design and deploy production-ready AI pipelines, data platforms, and decision-support tools - translating complex technical requirements into scalable, secure, and measurable outcomes. Experience spans global health research, enterprise software at Microsoft, and AI consulting for healthcare and finance.

## Technical Skills

**AI & ML:** LLMs, AI agents, multi-agent systems, RAG, NLP (natural language processing), intelligent automation, MLOps; OpenAI SDK, Anthropic Claude SDK, Azure OpenAI, Azure AI Foundry; LangChain, LangGraph; knowledge graphs, semantic concept extraction; local LLMs for prototyping; Databricks; prompt, context, and token optimization (FinOps for AI); model selection, evaluation, and A/B testing; automated LLM-based quality scoring pipelines; AI guardrails and Responsible AI practices; document ingestion pipelines (multi-format: PDF, image, DOCX, text, OCR), recursive chunking, sentence-transformers embeddings, hybrid search (vector + BM25/RRF), sqlite-vec and pgvector; multi-agent supervisor orchestration patterns (LangGraph-equivalent: supervisor node, conditional routing, async interrupt/resume).

**Data & Cloud:** Azure Data Factory, Synapse Analytics, Analysis Services, Data Lake Storage, Event Hub, Cosmos DB, Microsoft Fabric; SQL, NoSQL, SQLite, ETL/ELT, data modeling, Data Lake, Redis, Blob, Azure Container Apps.

**Languages:** Python, C#, JavaScript, TypeScript, React, R, SQL, PowerShell.

**Infrastructure & DevOps:** Docker, Kubernetes; Azure DevOps, GitHub Actions, Drone; ARM, Terraform, Bicep (IaC); FastAPI, RESTful APIs; vector database (pgvector, sqlite-vec); async/parallel pipeline architecture; caching strategies for AI services; GitHub Copilot.

**Architecture & Frameworks:** Solutions Architecture; .NET, Node.js, Entity Framework; TCP/IP, HTTP, Zero Trust Network; SDL, Scrum, Agile, DevOps; machine learning systems design.

**Security & Compliance:** Threat modeling, SAML, OAuth2.0, SSO; GDPR, CCPA, HIPAA; Linux systems administration and internals.

## Soft Skills

**Leadership:** Technical strategy ownership in ambiguous problem spaces; cross-functional alignment from engineering to executive stakeholders; mentorship and technical leveling of engineering teams.

**Communication:** Translating technical tradeoffs into clear recommendations for non-technical decision-makers; trusted advisor role in AI adoption for regulated domains; rapidly acquiring domain knowledge (customer support, epidemiology, global health) and translating it into production requirements.

**Professional:** Security-first mindset; responsible AI and data privacy focus; bias toward measurable outcomes over process.

## Personal Projects

### Legal Document Intelligence System
*2025 - Present*

Built a production RAG pipeline for legal document analysis: Google and MS Graph API source connectors, multi-format extraction (PDF, DOCX, EML, JPG, XLSX, OCR), classification-first metadata enrichment, recursive chunking tuned for legal prose, sentence-transformers embeddings (768 dims), and semantic search with sqlite-vec. Benchmarked chunk-level vs single-doc retrieval: chunk strategy scores 13% higher precision (0.538 vs 0.475 avg similarity) with only 42% result overlap, confirming chunks surface passage-level relevance that document-level embeddings miss. 314 documents, 4,391 chunks, sub-200ms queries. Optimized for maximum read-dache tokens.

Designed and operate a multi-agent assistant system with supervisor orchestration: primary agent routes tasks to specialized agents (code, legal, research) by type and cost. Async delegation pattern maps to LangGraph interrupt/resume. Each agent is tool-augmented with typed input/output schemas.

### Semantic Analysis Platform
*2026 - Present*

Built a full-stack document intelligence platform for multi-source ingestion, semantic analysis, and knowledge mapping. FastAPI backend + React frontend; ingests URLs, PDFs, and text with automated AI suspicion and quality ratings post-ingest. LLM pipeline performs semantic chunking by logical section (chapter/article boundaries), extracts concept graphs per section, merges partial graphs with deduplication, and runs a consolidation pass for semantic synonym resolution, covering 100% of the document. Fact-check feature extracts verifiable claims, queries Perplexity, and feeds results back into the quality score. Three synchronized views (concept map, chat, document) over the same content, with bidirectional highlight and navigation between views.

## Professional Experience

### Senior Software Engineer (Data and Statistical Modeling) - Gates Foundation
*2025 - Current*  
*Seattle, WA*

- Architected AI-powered epidemiology dashboards for national malaria eradication programs in Nigeria, Senegal, and Benin - surfacing disease indicators, intervention cost-effectiveness, and scenario simulations used by health ministries to drive policy decisions.
- Built end-to-end data pipelines from disease simulation outputs to interactive decision-support visualizations for IDM researchers and partner institutions.
- Applied production AI practices across the full pipeline: data quality controls, privacy-by-design, prompt engineering, evaluation pipelines, and DevSecOps for global health research environments.
- Led cross-functional technical planning across research, engineering, and operations - translating epidemiology requirements into production AI systems adopted by partner institutions.

### Senior AI Solutions Consultant - Dura Digital
*2025 - Current*  
*Seattle, WA*

- Provided architectural direction and implementation strategy for healthcare and financial organizations adopting ML/AI tooling and infrastructure - serving as trusted technical advisor during early AI adoption phases.
- Identified key constraints and designed implementation roadmaps to bridge gaps between existing infrastructure and planned AI-focused architectures, enabling clients to move from strategy to production with clear milestones.
- Delivered secure, scalable, and compliant AI solutions for workflow automation, translating ambiguous business requirements into actionable technical plans with measurable outcomes.

### Software Engineer II - Microsoft
*2019 - 2025*  
*Redmond, WA*

- Designed and shipped frontier ML/AI speech-to-text systems for enterprise customer support, reducing agent oversight overhead by 50% through intelligent automation and real-time AI assistance.
- Built real-time and post-call customer satisfaction metric pipelines, enabling live supervisor awareness and KPI rollup evaluation across global support operations.
- Architected and delivered large-scale cloud-native enterprise applications using Azure infrastructure (Data Factory, Event Hub, Data Lake, Cosmos DB), DevOps practices, and CI/CD automation.
- Conducted threat modeling and implemented zero-trust security strategies to protect critical services and sensitive customer data; managed incident response for high-priority production outages.

### Software Engineer - Motiv Inc. (Microsoft Contract)
*2017 – 2019*  
*Redmond, WA*

- Built secure, high-throughput cloud applications at Microsoft's Core Platform Engineering Group: APIs and microservices, vulnerability mitigation, data privacy compliance, DevOps, and security hardening.

### Software Engineer - Getty Images
*2012 – 2017*  
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
