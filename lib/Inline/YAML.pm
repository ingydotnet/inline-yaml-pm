use strict; use warnings;
package Inline::YAML;
our $VERSION = '0.13';

use Filter::Simple;
use YAML::XS;

FILTER {
    s/(\r?\n\-\-\-.*?\n\.\.\.\r?\n)/ YAML::XS::Load(<<'...');$1/gs;
};

1;
