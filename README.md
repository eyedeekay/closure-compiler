# closure-compiler

This is a docker image that makes it easier to use the Closure Compiler(Google's
Javascript analysis tool) on systems where Python 2 isn't available and/or easy
to use. It places the closure compiler into a Docker container and provides a
wrapper script.

## Usage:

To build the container:

``` bash
docker build -t closure-linter .
```

The wrapper script treats the working directory as a volume mount. If you are
using the wrapper script, `fixjsstyle` can **ONLY** touch files in or under
the working directory. Running it on javascript files in the parent directory
will not work.

The wrapper script looks like this:

```
#! /usr/bin/env sh
docker run --rm -ti --name fixjsstyle --workdir /source --volume `pwd`:/source closure-linter fixjsstyle $@
```

And you can place it into your `$PATH` or run it by providing an absolute path.