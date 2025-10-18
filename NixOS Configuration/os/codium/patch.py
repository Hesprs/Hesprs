import json
import os
import sys

out_dir = sys.argv[1]
css_path = sys.argv[2]

# Read CSS at runtime (during postInstall)
with open(css_path, 'r') as f:
    css_content = f.read()

# Patch product.json
product_json = os.path.join(out_dir, 'lib', 'vscode', 'resources', 'app', 'product.json')
with open(product_json, 'r') as f:
    data = json.load(f)

data['extensionsGallery'] = {
    'serviceUrl': 'https://marketplace.visualstudio.com/_apis/public/gallery',
    'controlUrl': 'https://main.vscode-cdn.net/extensions/marketplace.json',
    'itemUrl': 'https://marketplace.visualstudio.com/items',
    'cacheUrl': 'https://vscode.blob.core.windows.net/gallery/index'
}

with open(product_json, 'w') as f:
    json.dump(data, f, indent=2)

# Patch workbench.html
workbench_html = os.path.join(out_dir, 'lib', 'vscode', 'resources', 'app', 'out', 'vs', 'code', 'electron-browser', 'workbench', 'workbench.html')
with open(workbench_html, 'r') as f:
    content = f.read()

if '</head>' not in content:
    raise RuntimeError("Expected </head> in workbench.html")

patched = content.replace('</head>', f'<style>{css_content}</style></head>', 1)

with open(workbench_html, 'w') as f:
    f.write(patched)
