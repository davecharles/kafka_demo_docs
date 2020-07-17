# Kafka Demo Docs

Welcome to the Kafka Demo documentation, mastered in 
[markdown](https://www.markdownguide.org/getting-started/), easily generated
and viewed.
  
## Getting Started

Clone the repo:

```bash
$ git clone git@github.com:davecharles/kafka_demo_docs.git
$ cd kafka_demo_docs
```

### Docker Compose

Using docker-compose is recommended to get started quickly.

```bash
$ make compose-build
$ make compose-up    # run detached
```

Once up, navigate a browser to `http://localhost:8000` to view the
documentation. When you're done:

```bash
$ make compose-down
```

### Building locally
You can just build locally, you'll need a suitable Python environment with the
dependencies defined in `requirements.txt` installed then:

```bash
$ make html
```

This publishes the documentation set to `build/html`. Navigate a browser to
`file:///<path-to-repo-folder>/build/html/index.html`.

---

This project is based on the
[sphinxdocs repository](https://github.com/davecharles/sphinxdocs), head on
over there for more details about the
[recommonmark](https://recommonmark.readthedocs.io) extension,
[Sphinx](https://www.sphinx-doc.org/en/master) and the
[Read the Docs](https://sphinx-rtd-theme.readthedocs.io) theme.
