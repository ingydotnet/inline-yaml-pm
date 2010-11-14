use inc::Module::Install;

name 'Inline-YAML';

perl_version '5.005003';

all_from 'lib/Inline/YAML.pm';
manifest_skip;
readme_from;
ack_xxx;
version_check;

requires 'YAML' => '0.70';
requires 'Filter::Simple';

WriteAll;
