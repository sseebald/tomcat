class tomcat::java {

  file { 'C:/jre-8u25-windows-i586.exe':
    ensure => present,
    mode   => 0777,
    source => "puppet:///modules/tomcat/jre-8u25-windows-i586.exe",
  }
  package { 'java':
    ensure          => installed,
    source          => 'C:/jre-8u25-windows-i586.exe',
    install_options => ['/s'],
  }

}
