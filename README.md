This repo includes two scripts, one that uses `exports_directories_only = True` ([`_fixed.sh`](./_fixed.sh)) and one that doesn't ([`_broken.sh`](./_broken.sh)). To test this out locally, copy the two scripts:

```shell
cp _broken.sh broken.sh
cp _fixed.sh fixed.sh
```

Sometimes you have to run `broken.sh` twice to get it to happen, but eventually it should lead to an error like this:

```
INFO: Analyzed target @npm_common-assets//:node_modules (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/lib/transformation/util/missing-plugin-helper.js', owner: '@npm_common-assets//:node_modules/@babel/core/lib/transformation/util/missing-plugin-helper.js'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-function-name/LICENSE', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-function-name/LICENSE'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-function-name/README.md', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-function-name/README.md'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-function-name/lib/index.js', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-function-name/lib/index.js'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-function-name/package.json', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-function-name/package.json'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/LICENSE', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/LICENSE'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/README.md', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/README.md'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/lib/index.js', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/lib/index.js'
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11: @npm_common-assets//:node_modules: missing input file 'external/npm_common-assets/node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/package.json', owner: '@npm_common-assets//:node_modules/@babel/core/node_modules/@babel/helper-get-function-arity/package.json'
....
Target @npm_common-assets//:node_modules failed to build
Use --verbose_failures to see the command lines of failed build steps.
ERROR: /private/var/tmp/_bazel_chris/370c4bc7721f5f64189aec037330a6f0/external/npm_common-assets/BUILD.bazel:5373:11 309 input file(s) do not exist
INFO: Elapsed time: 0.464s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
FAILED: Build did NOT complete successfully
```

Hopefully, running `./fixed.sh` completes successfully no matter how many times you run it.

Based on [this repo](https://github.com/chenders/bazel_nodejs_repro) which reproduced the original problem.
