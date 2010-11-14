package Inline::YAML;
$VERSION = '0.10';
use strict;
use Filter::Simple;

use YAML;
FILTER {
    s/(\n\-\-\-.*?\n\.\.\.)/ YAML::Load(<<'...');$1/gs;
};

1;

=head1 NAME

Inline::YAML - Specify YAML content directly in your Perl

=head1 SYNOPSIS

    use Inline::YAML;
    
    my @hackers =
    ---
    name: Larry Wall
    title: Fearless Leader
    hacks: [patch, perl]
    ---
    name: Damian Conway
    title: Thunder from Down Under
    hacks:
      - Parse::RecDescent
      - Quantum::SuperPositions
    ---
    name: Brian Ingerson
    nickname: ingy
    hacks:
      - Inline
      - YAML
      - Inline::YAML
    ...

    foreach (@hackers) {
        my $quote = $_->{name};
        $quote .= ", the $_->{title},"
          if defined $_->{title};
        $quote .= ", aka '$_->{nickname}',"
          if defined $_->{nickname};
        $quote .= ' hacked ';
        $quote .= join(' and ', @{$_->{hacks}});
        $quote .= ".\n";
        print $quote;
    }

=head1 DESCRIPTION

YAML let's you express any Perl data in a very clean and easy to read
format. Inline::YAML lets you put YAML streams directly into your Perl
programs without any extra syntax.

If you need to express a large static data structure in your code, YAML
is a great way to do it. It has a minimum of control characters and
uses indentation for structure. You'll need less quotes, less commas
and less braces.

The YAML streams should begin with '---' in column 1, and end with '...'
in column 1, both of which are proper YAML constructs for starting and
ending a stream. The YAML will return a list equal in length to the
number of '---' lines.

=head1 HOW IT WORKS

Inline::YAML is a simple filter (using Filter::Simple) that turns:

    my $answers =
    ---
    who: You
    what: Chicken Butt
    where: Under There
    ...

into:

    my $answers = YAML::Load <<'...';
    ---
    who: You
    what: Chicken Butt
    where: Under There
    ...

=head1 AUTHOR

Brian Ingerson <INGY@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2002. Brian Ingerson. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut