# CData

This repository contains the CData preprocessor source, build directories, and CData guide.

The CData build still depends on shared CFAST source files. For this local split, keep this repository next to `cfast-fork`:

```text
work/
  cdata-fork/
  cfast-fork/
```

The CData makefile compiles local CData sources from `Source/Cdata`, CData-local overrides from `Source/CFAST`, and remaining shared CFAST sources from `../cfast-fork/Source/CFAST`.

The files in `Source/CFAST` are CFAST source modules that carry CData-specific hooks. Keeping them here allows the CFAST repository to remove CData-only maintenance while CData continues to use the shared CFAST source tree for ordinary solver/parser modules.

For example, on macOS with GNU Fortran:

```bash
cd Build/CData/gnu_osx
./make_cdata.sh
```

The CData guide remains in `Manuals/CFAST_CData_Guide`. Its build scripts use shared manual assets from the sibling `cfast-fork/Manuals` tree.
