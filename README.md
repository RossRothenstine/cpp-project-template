# Cpp Project Template

An opinionated C++ project template built with CMake, VCPkg, and Doxygen.

## Features

- **CMake**: Build system generator
- **VCPkg**: Package manager
- **Doxygen**: Documentation generator
- **Catch2**: Unit testing framework

## Prerequisites

- [CMake](https://cmake.org/)
- [Doxygen](https://www.doxygen.nl/)
- [Python](https://www.python.org/)

## Installation

### Using GitHub

1. Click the "Use this template" button at the top of the repository.
2. Clone your new repository:
```bash
git clone --recursive
```
3. Initialize the VCPkg submodule:
```bash
./external/vcpkg/bootstrap-vcpkg.sh
```

### Using Git


1. Clone this repository, as your project directory:
```bash
git clone --recursive https://github.com/RossRothenstine/cpp-project-template.git my-project
```
2. Delete the git history:
```bash
cd my-project
rm -rf .git
```
3. Initialize a new git repository:
```bash
git init
```
4. Commit the initial project:
```bash
git add .
git commit -m "Initial commit"
```

## Methodology

This project template is designed to be a starting point for new C++ projects. It includes a number of features that I find useful in my own projects, but feel free to modify it to suit your own needs.

This template is intended to be "batteries included", but not a means as a "low code" or "no code" replacement for learning how to use the tools it includes. I recommend reading the code and also the documentation when you reach a point you don't understand.

The CMake project chooses to not use file globbing for sources. Instead, each source file is explicitly listed in the `Sources.cmake` file accompanying the target. This is considered a best practice for CMake projects, as per the [CMake documentation](https://cmake.org/cmake/help/latest/command/file.html#filesystem) this [blog post](https://crascit.com/2016/01/31/enhanced-source-file-handling-with-target_sources/) along with Stackoverflow posts like [this one](https://stackoverflow.com/questions/1027247/best-way-to-specify-sourcefiles-in-cmake).

Source filenames are using snake_case. This is my personal preference, but it also has some real world value as on the Windows platform, file names are case insensitive. This can lead to issues when working with a case sensitive platform like Linux. Using snake_case helps to avoid these issues.
