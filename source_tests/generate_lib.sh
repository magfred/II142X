#!/bin/sh
WORKING_DIR=$(pwd)
RUST_SOURCE_PATH="../reimplementation/unsafe_slist"
RUST_HEADER_PATH="rust_lib.h"
RUST_LIB_PATH="target/debug/libsingly_linked_list_rust.a"
RUST_DEBUG_PATH="target/debug/libsingly_linked_list_rust.d"
cd ${RUST_SOURCE_PATH}
echo "Building library"
./gen_lib_bindings.sh 1>/dev/null
cd ${WORKING_DIR}
echo "Copying resources"
cp ${RUST_SOURCE_PATH}/${RUST_LIB_PATH} lib/
cp ${RUST_SOURCE_PATH}/${RUST_DEBUG_PATH} lib/
cp ${RUST_SOURCE_PATH}/${RUST_HEADER_PATH} test/lib_impl/
echo "Done."