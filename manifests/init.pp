class tomcat 
(
  $version = '6.0.33',
  $install_dir = undef,
  $port = undef,
)
{
  
  if $version =~ /^5/ {
    $service_name = 'ACE'
  }
  elsif $version =~ /^6/ {
    $service_name = 'PFM'
  }
  elsif $version =~ /^7/ {
    $service_name = 'FCRA'
  }
  else {
    notify { "Unsupported version": }
  }

  class { 'tomcat::java': }

  class { 'tomcat::package': 
    version => $version,
  }

  #  class { 'tomcat::service':
  #    service_name => $service_name,
  #  }

  notify { "current service_name would be $service_name": }
}
