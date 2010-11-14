use CPAN::MakeMaker;

$PREREQ_PM{YAML} = '0.35';
$PREREQ_PM{Filter::Simple} = 0;

WriteMakefile;
