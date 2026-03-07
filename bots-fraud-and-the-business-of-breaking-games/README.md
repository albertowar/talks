# Bots, Fraud, and the Business of Breaking Games

In the world of online gaming, risk looks very different from banking or e-commerce.

Players expect frictionless fun, not identity verifications. However, behind every login, there is a real-money trading economy, automation, and account theft that feeds a massive underground market.

This talk explores how different online attackers profit from video games—from bot farms and AI-driven automation to resale networks and phishing campaigns—and why the gaming environment represents a high-profit, low-legal-risk target.

We will also analyze how studios respond through risk-based authentication, behavioral defenses, and a constant balance between security and player experience.

Through real-world examples and interactive "think like both sides" exercises, attendees will understand how defenders and attackers adapt in a continuous cat-and-mouse dynamic.

The talk concludes with practical advice:
- Protecting your account
- Detecting phishing
- Monitoring credential leaks
- Participating in programs like Riot's Bug Bounty.

Both students and professionals will leave with a clear vision of how business realities shape security decisions.

> This talk was presented at **Hackers Week 2026** at the **University of Malaga**.

## Follow-up Links

For students looking to dive deeper into the world of game security, here are some curated resources:

### Defense

#### References (Talks, Blogs & Papers)
- [Riot Games: Riot's Approach to Anti-Cheat](https://technology.riotgames.com/news/riots-approach-anti-cheat): Excellent technical deep dives into anti-cheat (Vanguard) and risk-based systems.
- [[OWASP LA 2016] "Running a Bug Bounty Program" by David Rook](https://technology.riotgames.com/news/running-bug-bounty-program): A foundational talk on the philosophy and operation of Riot's bug bounty program.
- [[GDC 2023] "Anti-Cheat: The Never-Ending War" by Narek Agasaryan](https://www.gdcvault.com/play/1025254/Anti-Cheat-The-Never-Ending): A high-level overview of the industry's approach to security and the evolution of anti-cheat.
- [GDC 2018: Valve's "Robocalypse Now"](https://www.youtube.com/watch?v=ObhK8lUfIlc): John McDonald's famous talk on using Deep Learning (VACnet) to combat cheating in CS:GO.
- [Easy Anti-Cheat (EAC) & Epic Online Services](https://dev.epicgames.com/docs/game-services/anti-cheat): Documentation and approach of the industry's most used third-party anti-cheat.
- [USENIX Security '23: "A Study of Multi-Factor and Risk-Based Authentication Availability"](https://www.usenix.org/conference/usenixsecurity23/presentation/gavazzi): A deep dive into the real-world availability and implementation of RBA and MFA.
- [OWASP Top 10 (2025)](https://owasp.org/Top10/2025/): The industry-standard list of the most critical web application security risks, updated for 2025.
- [OWASP Game Security Framework (GSF)](https://owasp.org/www-project-gamesec-framework/): An active project focused on threat modeling and defending modern gaming ecosystems.
- [The Economy of Botting in MMORPGs](https://mural.maynoothuniversity.ie/id/eprint/2876/1/SDP_Cheating.pdf): A case study on the financial drivers and ecosystem behind automation in gaming.
- [[VDTRIESTE 2024] "Cracking the Code: Decoding Anti-Bot Systems!" by Fabien Vauchelles](https://www.youtube.com/watch?v=0S5SRT-WIUo): An exploration of how modern anti-bot systems use fingerprinting and behavioral analysis to challenge automated traffic.
- [[x33fcon 2023] "How Much Is The Phish? Evolving Defences Against Evilginx Reverse Proxy Phishing" by Kuba Gretzky](https://www.youtube.com/watch?v=C-Fh4sIdY8c): A session on the "arms race" between reverse proxy phishing tools and defensive measures like JA4 fingerprinting and FIDO2.
- [[Black Hat USA 2017] "Bot vs. Bot for Evading Machine Learning Malware Detection" by Hyrum Anderson](https://www.youtube.com/watch?v=KTfrbvxKQwo): A deep dive into using Reinforcement Learning to automatically discover mutations that bypass ML-based security products.
- [[CypherCon 6.0] "Tales of Physical PenTests & How to Defend" by Ryan Zagrodnik & Chad Finkenbiner](https://www.youtube.com/watch?v=cNf8J-ot-74): A collection of real-world physical penetration testing stories and practical strategies for defending physical perimeters.
- [Technical Concept: Control Flow Flattening](https://blog.jscrambler.com/jscrambler-101-control-flow-flattening/): An explanation of the structural transformation that hides a program's logic by flattening its conditional branches and loops into a single flat structure.

#### Tools
- [UltimateAntiCheat](https://github.com/AlSch092/UltimateAntiCheat): A usermode anti-cheat system built in C++ designed to detect common attack vectors like debugging, memory editing, and code injection.
- [Open Anti Cheat System (OACS)](https://github.com/lrq3000/oacs): A machine learning framework in Python for developing server-side anti-cheat systems, focusing on anomaly detection.
- [Little-Anti-Cheat](https://github.com/J-Tanzanite/Little-Anti-Cheat): A popular open-source anti-cheat for Source Engine games (TF2, CS:GO) that runs on SourceMod.
- [javascript-obfuscator (Obfuscator.io)](https://github.com/javascript-obfuscator/javascript-obfuscator): The most widely used open-source tool for JavaScript protection, featuring control flow flattening, string array encoding, and dead code injection.
- [JS-Confuser](https://github.com/MichaelXF/js-confuser): A powerful open-source obfuscator known for its aggressive transformations and ability to make code highly resilient to static analysis.
- [Google Closure Compiler](https://developers.google.com/closure/compiler): A tool for making JavaScript download and run faster, often used in "Advanced Mode" for obfuscation.
- [FingerprintJS](https://github.com/fingerprintjs/fingerprintjs): FingerprintJS is an open-source, client-side, browser fingerprinting library that queries browser attributes and computes a hashed visitor identifier from them.

### Attack

#### References (Talks & Blogs)
- [[SeleniumConf 2023] "Python Selenium: Fundamentals to Frameworks (with SeleniumBase)" by Michael Mintz](https://www.youtube.com/watch?v=EablmOazy-k): A comprehensive look at the evolution of Selenium, driver management, and how SeleniumBase simplifies complex automation tasks.

#### Tools
- [Strix](https://github.com/usestrix/strix): An open-source AI penetration testing agent ("AI Hacker") that uses LLMs to autonomously identify, exploit, and validate security vulnerabilities.
- [RecaptchaV2-IA-Solver](https://github.com/DannyLuna17/RecaptchaV2-IA-Solver): An open-source project using the YOLOv8x object detection model to solve Google reCAPTCHA v2 challenges.
- [JS Deobfuscator (UglifyJS)](https://github.com/mishoo/UglifyJS): While UglifyJS is for minification, its `ast` parsing is foundational for building deobfuscators.
- [restringer](https://github.com/HumanSecurity/restringer): A JavaScript deobfuscation tool that reconstructs strings and simplifies complex logic.
- [CyberChef](https://gchq.github.io/CyberChef/): The "Cyber Swiss Army Knife"—essential for multi-stage deobfuscation, decoding Base64, and reversing hex/char encoding.
- [Synchrony](https://github.com/relative/synchrony): A deobfuscator for modern, heavily obfuscated JavaScript (like that produced by JScrambler or Obfuscator.io).
- [SeleniumBase](https://seleniumbase.com/): A powerful Python framework for browser automation, end-to-end testing, and web scraping with built-in features to bypass bot detection.
- [Scrapling](https://github.com/D4Vinci/Scrapling): An adaptive web scraping framework that uses an intelligent parser to handle website changes and bypass anti-bot systems like Cloudflare Turnstile.
- [Browser Use](https://browser-use.com/): An open-source Python library that allows LLM-powered AI agents to autonomously control a web browser using natural language.
- [Crawl4ai](https://docs.crawl4ai.com/): An AI-friendly web crawling framework optimized for LLMs and RAG pipelines, transforming web content into clean Markdown or JSON.
- [Browserless (Open Source)](https://github.com/browserless/browserless): A self-hosted headless browser-as-a-service providing managed Chrome instances for high-scale scraping, automated PDF generation, and E2E testing.
- [httpcloak](https://github.com/sardanioss/httpcloak): A Go-based HTTP client that mimics the TLS and HTTP/2 fingerprints of modern browsers to make automated traffic indistinguishable from real users.
- [Camoufox](https://github.com/samuelcolvin/camoufox): A custom, stealthy Firefox-based browser engine designed to achieve high stealth scores against modern bot detectors.
