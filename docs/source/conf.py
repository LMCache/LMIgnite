# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'lmcache-cloud-docs'
copyright = '2025, Yihua Cheng'
author = 'Yihua Cheng'
release = 'v0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

# Theme configuration
html_theme = 'sphinx_rtd_theme'  # Read the Docs theme (similar to Rancher)

# Theme options
html_theme_options = {
    'navigation_depth': 4,
    'collapse_navigation': False,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': False
}

# Extensions
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    'sphinx.ext.intersphinx',
]

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_static_path = ['_static']

# Logo and favicon
html_logo = '_static/logo.png'  # Add your logo
html_favicon = '_static/favicon.ico'

# Custom CSS
html_static_path = ['_static']
html_css_files = ['custom.css']

templates_path = ['_templates']
exclude_patterns = []
