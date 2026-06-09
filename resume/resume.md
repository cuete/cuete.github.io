```{=html}
<div class="resume-header">
<div class="rh-left">
<h1>Alejandro Echeverria</h1>
<div class="rh-title">Senior Data and AI Solutions Engineer</div>
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

Senior Software Engineer with 18+ years of experience across data engineering, AI systems, and cloud-native software. I design and deploy production-ready AI pipelines, data platforms, and decision-support tools - translating complex research and business requirements into scalable, secure, and measurable outcomes, with a track record of stakeholder alignment from research teams to executive leadership. Experience spans global health research, enterprise software at Microsoft, and AI consulting for healthcare and finance.

## Technical Skills

**AI & ML:** LLMs, AI agents, multi-agent systems, RAG, NLP (natural language processing), intelligent automation, MLOps; OpenAI SDK, Anthropic Claude SDK, Azure OpenAI, Azure AI Foundry; LangChain, LangGraph; local LLMs for prototyping; Databricks; prompt, context, and token optimization (FinOps for AI); model selection, evaluation, and A/B testing; AI guardrails and Responsible AI practices; document ingestion pipelines (multi-format: PDF, DOCX, email, OCR), recursive chunking, sentence-transformers embeddings, hybrid search (vector + BM25/RRF), sqlite-vec and pgvector; multi-agent supervisor orchestration patterns (LangGraph-equivalent: supervisor node, conditional routing, async interrupt/resume).

**Data & Cloud:** Azure Data Factory, Synapse Analytics, Analysis Services, Data Lake Storage, Event Hub, Cosmos DB, Microsoft Fabric; SQL, NoSQL, SQLite, ETL/ELT, data modeling, Data Lake, Redis, Blob, Azure Container Apps.

**Languages:** Python, C#, JavaScript, TypeScript, R, SQL, PowerShell.

**Infrastructure & DevOps:** Docker, Kubernetes; Azure DevOps, GitHub Actions, Drone; ARM, Terraform, Bicep (IaC); FastAPI, RESTful APIs; vector database (pgvector, sqlite-vec); async/parallel pipeline architecture; caching strategies for AI services; GitHub Copilot.

**Architecture & Frameworks:** Solutions Architecture; .NET, Node.js, Entity Framework; TCP/IP, HTTP, Zero Trust Network; SDL, Scrum, Agile, DevOps; machine learning systems design.

**Security & Compliance:** Threat modeling, SAML, OAuth2.0, SSO; GDPR, CCPA, HIPAA; Linux systems administration and internals.

## Soft Skills

**Delivery & Leadership:** Technical strategy and roadmap ownership across ambiguous, high-stakes problem spaces; cross-functional alignment from engineering to executive stakeholders; mentorship and technical leveling of engineering teams.

**Communication & Influence:** Translating complex technical tradeoffs into clear recommendations for non-technical decision-makers; driving consensus across research, engineering, and operations; trusted advisor role in AI adoption for regulated domains; embedding with domain experts (epidemiology, global health) to rapidly acquire working knowledge and translate it into production technical requirements.

**Professional:** Security-first mindset with focus on data privacy and responsible AI; bias toward measurable outcomes over process; continuous investment in emerging AI and data engineering practices.

## Personal Projects

### Legal Document Intelligence System
*2025 - Present*

Built a production RAG pipeline for legal document analysis from scratch. Source connectors for Gmail API and OneDrive, multi-format extraction (PDF, DOCX, EML, XLSX, images via OCR), and a classification layer that enriches document metadata before indexing. Recursive chunking (800 chars / 150 overlap) tuned for legal prose, vector embeddings with sentence-transformers (all-mpnet-base-v2, 768 dims), and hybrid semantic search using sqlite-vec with metadata filters. In LangChain terms: `DocumentLoader` + `DocumentTransformer` + `RecursiveCharacterTextSplitter` + `VectorStore` pipeline. In LlamaIndex: `SimpleDirectoryReader` with custom `MetadataExtractor` + `SentenceSplitter` + `VectorStoreIndex`. 314 documents, 4,391 chunks, sub-200ms queries.

Also designed and operate a multi-agent personal assistant system with a supervisor orchestration pattern: a primary agent routes tasks to specialized agents (code, legal, research) based on task type and cost. Async delegation via spawn/yield maps to LangGraph's interrupt/resume pattern. Each agent is tool-augmented with typed schemas equivalent to LangChain `StructuredTool` / LlamaIndex `FunctionTool`.

## Professional Experience

### Senior Software Engineer (Data and Statistical Modeling) - Gates Foundation
*2025 – Current*  
*Seattle, WA*

- Architected AI-powered epidemiology dashboards deployed for national malaria eradication programs in Nigeria, Senegal, and Benin - surfacing key disease indicators, intervention cost-effectiveness, and national strategy scenario simulations used by health ministries and research partners to drive data-informed policy decisions.
- Built end-to-end data pipelines from epidemiology and disease simulation outputs to interactive decision-support visualizations, enabling IDM researchers and partner institutions to model intervention scenarios and project outcomes of national eradication strategies.
- Applied production AI practices across the research-to-deployment pipeline: data quality controls, privacy-by-design, prompt engineering, evaluation pipelines, and DevSecOps (CI/CD, automated security reviews) for global health research environments.
- Led technical planning and cross-functional alignment across research, engineering, and operations - translating complex epidemiology requirements into production-grade AI systems with direct adoption by partner institutions.

### Senior AI Solutions Consultant - Dura Digital
*2025 – Current*  
*Seattle, WA*

- Provided architectural direction and implementation strategy for healthcare and financial organizations adopting ML/AI tooling and infrastructure - serving as trusted technical advisor during early AI adoption phases.
- Identified key constraints and designed implementation roadmaps to bridge gaps between existing infrastructure and planned AI-focused architectures, enabling clients to move from strategy to production with clear milestones.
- Delivered secure, scalable, and compliant AI solutions for workflow automation, translating ambiguous business requirements into actionable technical plans with measurable outcomes.

### Software Engineer II - Microsoft
*2019 – 2025*  
*Redmond, WA*

- Designed and shipped frontier ML/AI speech-to-text systems for enterprise customer support, reducing agent oversight overhead by 50% through intelligent automation and real-time AI assistance.
- Built real-time and post-call customer satisfaction metric pipelines, enabling live supervisor awareness and KPI rollup evaluation across global support operations.
- Architected and delivered large-scale cloud-native enterprise applications using Azure infrastructure (Data Factory, Event Hub, Data Lake, Cosmos DB), DevOps practices, and CI/CD automation.
- Conducted threat modeling and implemented zero-trust security strategies to protect critical services and sensitive customer data; managed incident response for high-priority production outages.

### Software Engineer - Motiv Inc. (Microsoft Contract)
*2017 – 2019*  
*Redmond, WA*

I developed secure, high-throughput, cloud applications at Microsoft\'s Core Platform Engineering Group. I developed APIs and microservices, identified and mitigated software vulnerabilities, enforced data privacy requirements, security, and compliance, implemented DevOps processes, and hardened resources and applications to meet world-class industry standards.

### Software Engineer - Getty Images
*2012 – 2017*  
*Seattle, WA*

I developed and tested web services and databases handling confidential financial data and the time-sensitive royalty calculation processes. Areas of experience included .NET development, relational databases, message brokers, monitoring and integration platforms, CI/CD, DevOps and Agile methodologies, and on-call engineering support. Getty Images is the global leader in multimedia and royalty services.

### Software Engineer in Test - iSoftStone Inc.
*2007 – 2012*  
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
