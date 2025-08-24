# HyperQB Standalone Application

## Continuous Deployment

The Continuous Deployment pipeline in `.github/workflows/release` automatically builds and releases HyperQB for macOS whenever a version tag is pushed to the repository. The workflow consists of the following key stages:

### Build Process

**Rust Backend Compilation**: The pipeline builds the HyperRUSTY component with _static_ linking to ensure a self-contained binary. It installs and caches Z3 as a static library, then compiles the Rust code in release mode.

**Flutter UI Application**: The workflow sets up Flutter 3.32.8 and builds a native macOS application from the hyperqb-ui codebase. The compiled Rust binary is embedded directly into the macOS app bundle's resources directory, creating a unified application package.

**Yosys Integration**: The pipeline downloads and integrates OSS CAD Suite. The tools are bundled directly into the macOS app package, eliminating the need for users to install additional dependencies.

### Release Process

The final stage creates a complete, self-contained macOS application bundle that includes the Flutter UI, Rust backend, and all necessary CAD tools. The app is zipped for distribution and automatically uploaded to GitHub Releases with the corresponding version tag.

## Creating a New Release

A new release of the application can be triggered by running `./new_version.sh`. The script will perform the following actions:

1. Ask for the new version number
2. Fetch the updates submodules HyperRUSTY and hyperqb-ui
3. Push to main
4. Add and push the version tag, which in turn will trigger the workflow in `.github/workflows/release.yml`

The automated pipeline will handle building, packaging, and releasing the application.

Check `.gitmodules` to see which branches the workflow uses to build the application.
