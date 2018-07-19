pkg_name=aem-base
pkg_origin=andy-dufour
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="http://nexus.inlet-delivery.com/repository/inlet-http/AEM_6.3_Quickstart.jar"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="f053cf0f4bd6627f4ce36faec1458192f70f0b8d0c36cbce9d763feef4259c11"
pkg_deps=(core/jdk8)
pkg_build_deps=(core/jdk8)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
pkg_exports=(
#   [host]=srv.address
  [port]=4502
#   [ssl-port]=srv.ssl.port
)
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_unpack() {
  return 0
}

do_build() {
  return 0
}

do_configure() {
  return 0
}

do_install() {
  cp ${HAB_CACHE_SRC_PATH}/AEM_6.3_Quickstart.jar ${pkg_prefix}/
  cd ${pkg_prefix}
}
