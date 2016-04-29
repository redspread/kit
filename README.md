# kit

Kit is a prototype of Kubernetes version control on top of `git` and `kubectl`. It allows for rapid development of ideas surrounding orchestrator versioning.

**Note:** kit is not intended for production use and may not necessarily maintain a stable file format.

## Dependencies
The following executables must be available in your PATH for kit to work:
- `kubectl` (tested with v1.2.3)
- `git` (tested with v2.8.1)

Kit is written in Ruby so no compilation is required.

## Running Kit
* The kit executable can be directly invoked
	* `./kit status`
* Add the kit executable directory to your path
	* `export PATH=$(pwd):$PATH` (run from within Kit repo)
* It can be useful to put this in your .zshrc/.bashrc files
	* `echo "export PATH=$(pwd):$PATH" >> .zshrc` **(zsh)**
	* `echo "export PATH=$(pwd):$PATH" >> .bashrc` **(bash)**
