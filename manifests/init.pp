class tomcat 
(
  $version = '6.0.33',
  $install_dir = undef,
  $port = undef,
)
{
  
  class { 'tomcat::java': }

  class { 'tomcat::package': 
    version => $version,
  }

  #  class { 'tomcat::service': }

}
