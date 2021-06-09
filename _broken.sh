git reset --hard 23e9aa2

rm -rf common-assets/node_modules
pushd common-assets && yarn && popd

git reset --hard 73a70e3

bazel --noworkspace_rc build --worker_quit_after_build @npm_common-assets//:node_modules

