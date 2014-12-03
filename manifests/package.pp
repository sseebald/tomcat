class tomcat::package 
(
  $version,
) 
{
  include profile::staging

  #file { "C:/staging":
  #  ensure => directory,
  #  mode   => 0777,
  #}

  staging::file { "apache-tomcat-${version}.exe":
    source  => "http://archive.apache.org/dist/tomcat/tomcat-6/v${version}/bin/apache-tomcat-${version}.exe",
    #target  => "C:/staging",
    #  require => File["C:/staging"],
  }

  file { "C:/staging/tomcat/apache-tomcat-${version}.exe": 
    ensure  => present,
    mode    => 0777,
    require => Staging::File["apache-tomcat-${version}.exe"],
  }

  package { "tomcat":
    ensure          => installed,
    source          => "C:/staging/tomcat/apache-tomcat-${version}.exe",
    require         => File["C:/staging/tomcat/apache-tomcat-${version}.exe"],
    install_options => ['/S'],
  }
}
