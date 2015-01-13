class tomcat::package 
(
  $version,
  $install_dir,
  $port,
)

{
  
  # To-do tracking
  #   - Need to fix package names as they are being 'created' each time since name doesn't match windows install name
  #

  include profile::staging
 
  staging::file { "apache-tomcat-6.0.43-windows-x64.zip":
    source => "http://mirror.metrocast.net/apache/tomcat/tomcat-6/v6.0.43/bin/apache-tomcat-6.0.43-windows-x64.zip",
  }


  
  # What follows is a relic of original implementation. Does it work? Yeah, kinda. Tomcat exe doesn't allow you to 
  # configure the application at all. The few parameters it does accept, /S and /D, are unreliable in my testing.
  # Therefore, this is being sent to the comment graveyard for later reference, but the correct implementation is to
  # be done through the .zip

  #  staging::file { "apache-tomcat-${version}.exe":
  #    source  => "http://archive.apache.org/dist/tomcat/tomcat-6/v${version}/bin/apache-tomcat-${version}.exe",
  #  }
  #
  #  file { "C:/staging/tomcat/apache-tomcat-${version}.exe": 
  #    ensure  => present,
  #    mode    => 0777,
  #    require => Staging::File["apache-tomcat-${version}.exe"],
  #  }
  #
  #  package { "tomcat":
  #    ensure          => installed,
  #    source          => "C:/staging/tomcat/apache-tomcat-${version}.exe",
  #    require         => File["C:/staging/tomcat/apache-tomcat-${version}.exe"],
  #    install_options => ['/S', "/D=${install_dir}"],
  #  }
}
