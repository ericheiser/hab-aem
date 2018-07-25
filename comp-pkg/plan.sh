pkg_name=comp-pkg
pkg_origin=skylerto
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="http://nexus.inlet-delivery.com/repository/inlet-http/inlet-navigator-aem-DEV.zip"
pkg_filename="inlet-navigator-aem-DEV.zip"
pkg_shasum="b8205b62c1a44a320703125a4cda94388e86dd134270f87761df45c3dbc82aac"
# pkg_deps=(core/glibc)
# pkg_build_deps=(core/make core/gcc)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
pkg_binds=(
  [author]="port username password"
)
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
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
  mv ${HAB_CACHE_SRC_PATH}/$pkg_filename $pkg_prefix/
}
