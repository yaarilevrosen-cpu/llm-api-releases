# Notice

llm-api installers, copyright 2026 the llm-api author (github.com/yaarilevrosen-cpu).

You may download, install and use these releases free of charge, on as many
machines as you like. The source code is not published and is not licensed
by this notice; the files here may not be redistributed in modified form.
They come with **no warranty of any kind**: you use them at your own risk.

## Third-party software

The releases contain or download these, each under its own license:

| Component | License | Where |
|---|---|---|
| Python (Windows setup only, embedded) | PSF License | `python/LICENSE.txt` in the install folder |
| FastAPI, Starlette, Pydantic, Uvicorn, HTTPX and their dependencies (Windows setup: bundled wheels; Linux: installed from PyPI) | MIT / BSD / Apache-2.0 | each package's `*.dist-info` folder |
| ddgs (web search) | MIT | its `*.dist-info` folder |
| Prism (code highlighting in the console) | MIT | `vendor/PRISM_LICENSE` |
| WinSW (Windows service wrapper, downloaded at install time, hash-checked) | MIT | https://github.com/winsw/winsw |
| Ollama (downloaded at install time from ollama.com, not bundled) | MIT | https://github.com/ollama/ollama |
| Models you download through the console | each model's own license | shown on ollama.com for each model |
