# Oracle-Fusion-Apps

```ruby
#!/bin/bash
REPO_URL="https://github.com/your-org/your-repo.git"
TAG="v1.2.3"
VBCS_URL="https://your-vbcs-instance"
USER="your-user"
PASS="your-password"

git clone $REPO_URL
cd your-repo
git checkout tags/$TAG

npm install
grunt vb-process-local --action=package

grunt vb-process-local --action=deploy --artifact=build.zip --target=$VBCS_URL --user=$USER --password=$PASS
```


``` Ruby
#!/bin/bash
REPO_URL="https://github.com/gokulakishorereddypuli/addpay.git"
TAG="v1.0"
VBCS_URL="https://appdevcs98825655-ocuocictrng29-iad.developer.ocp.oraclecloud.com"
USER="98825655-ora039"
PASS="k99X53AN52"

git clone $REPO_URL
cd addpay
git checkout tags/$TAG

npm install
grunt vb-process-local --action=package

grunt vb-process-local --action=deploy --artifact=build.zip --target=$VBCS_URL --user=$USER --password=$PASS

```


``` Ruby
#!/bin/bash
set -e

echo "Starting VB app deployment from tag..."

# Configurable variables
TAG_NAME="v1.0.0"
GIT_REPO_URL="https://<TOKEN>@github.com/my-org/my-private-repo.git"
APP_DIR="my-vb-app"
WORK_DIR="$WORKSPACE/app"
DEPLOY_TARGET_NAME="my-vbcs-target"

# Clone the specific tag
git clone --branch "$TAG_NAME" --depth 1 "$GIT_REPO_URL" "$WORK_DIR"
cd "$WORK_DIR"

# Build (if needed)
vb-build --app-dir "$APP_DIR" --output-dir "$WORK_DIR/output"

# Deploy to VBCS
vb-deploy --app-dir "$APP_DIR" --target "$DEPLOY_TARGET_NAME"

echo "Deployment complete."

```



``` Ruby
#!/bin/bash

# Variables
REPO_URL="https://github.com/gokulakishorereddypuli/addpay.git"
TAG="v1.0"
VBCS_URL="https://appdevcs98825655-ocuocictrng29-iad.developer.ocp.oraclecloud.com"
USER="98825655-ora039"
PASS="k99X53AN52"

# Clone and checkout the tag
git clone $REPO_URL
cd addpay
git checkout tags/$TAG

# Install dependencies
npm install

# Clean previous build artifacts if any
rm -rf build
mkdir build

# Step 1: Create sources.zip (raw source code)
# Exclude node_modules and build directories for a clean package
zip -r build/sources.zip . -x "node_modules/*" -x "build/*" -x ".git/*"

# Step 2: Build/minify assets as per your build process
# (Assuming grunt handles this. If not, add your build/minify commands here)
grunt vb-process-local --action=build

# Step 3: Create built-assets.zip (compiled assets)
# Adjust the path if your build output is in a different directory
if [ -d "dist" ]; then
    zip -r build/built-assets.zip dist/*
else
    echo "Warning: 'dist' directory not found. Skipping built-assets.zip creation."
fi

# Step 4: Package the application (if your Gruntfile creates build.zip)
grunt vb-process-local --action=package

# Step 5: Deploy the packaged application to VBCS
# (Assumes build.zip is created by the previous step)
grunt vb-process-local --action=deploy --artifact=build.zip --target=$VBCS_URL --user=$USER --password=$PASS

echo "Deployment complete."
```

