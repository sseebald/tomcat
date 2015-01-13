class tomcat 
(
  $version = '6.0.33',
  $install_dir = undef,
  $port = undef,
)
{
  # Variable naming:
  #   $service_name = Different service names based on version of tomcat
  #   $tomcat_version = Thought here is to build the exe string for service creation...ie tomcat${tomcat_version}.exe

  if $version =~ /^5/ {
    $service_name = 'ACE'
    $tomcat_version = '5'
  }
  elsif $version =~ /^6/ {
    $service_name = 'PFM'
    $tomcat_version = '6'
  }
  elsif $version =~ /^7/ {
    $service_name = 'FCRA'
    $tomcat_version = '7'
  }
  else {
    notify { "Unsupported version": }
  }

  # Rudimentary java installation. Lot's that we can do here to build it out a bit. 
  # First, let's just get it installed, all defaults for now.

  class { 'tomcat::java': }

  class { 'tomcat::package': 
    version     => $version,
    install_dir => $install_dir,
    port        => $port,
  }

  #  class { 'tomcat::service':
  #    service_name => $service_name,
  #  }

  #  notify { "current service_name would be $service_name": }
}
