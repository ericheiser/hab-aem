pkg_name=aem-publisher
pkg_origin=andy-dufour
pkg_version="6.3.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
# pkg_source="http://nexus.inlet-delivery.com/repository/inlet-http/AEM_6.3_Quickstart.jar"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="f053cf0f4bd6627f4ce36faec1458192f70f0b8d0c36cbce9d763feef4259c11"
pkg_deps=(andy-dufour/aem-base core/curl core/jdk8)
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
pkg_binds=(
  [author]="port username password"
)
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"
do_download() {
  return 0
}

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
  cd ${pkg_prefix}
  mkdir -p crx-quickstart/install
  mkdir -p crx-quickstart/logs
  cp ${PLAN_CONTEXT}/config/org.apache.sling.commons.log.LogManager.config ${pkg_prefix}/crx-quickstart/install/
}
