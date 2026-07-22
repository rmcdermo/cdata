# CData

This repository contains the CData preprocessor source, build directories, and CData guide.

The CData build still depends on shared CFAST source files. Keep this repository next to `cfast`:

```text
firemodels/
  cdata/
  cfast/
```

The CData makefile compiles local CData sources from `Source/Cdata`, CData-local overrides from `Source/CFAST`, and remaining shared CFAST sources from the sibling `../cfast/Source/CFAST`.

For local development clones that use a different sibling name, set `CFAST_REPO` when running make:

```bash
cd Build/CData/gnu_linux_db
make -f ../makefile CFAST_REPO=../../../../cfast-fork gnu_linux_db
```

If `CFAST_REPO` is not set, the makefile looks first for `../../../../cfast`, then for `../../../../cfast-fork`.

The files in `Source/CFAST` are CFAST source modules that carry CData-specific hooks. Keeping them here allows the CFAST repository to remove CData-only maintenance while CData continues to use the shared CFAST source tree for ordinary solver/parser modules.

For example, on macOS with GNU Fortran:

```bash
cd Build/CData/gnu_osx
./make_cdata.sh
```

The CData guide remains in `Manuals/CFAST_CData_Guide`. Its build scripts use shared manual assets from the sibling `cfast/Manuals` tree, with `cfast-fork` accepted as a local development fallback.
