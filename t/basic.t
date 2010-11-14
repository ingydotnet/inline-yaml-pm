use Test;
BEGIN { plan tests => 1 }
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

ok(YAML::Dump(@hackers), <<END);
--- #YAML:1.0
hacks:
  - patch
  - perl
name: Larry Wall
title: Fearless Leader
--- #YAML:1.0
hacks:
  - Parse::RecDescent
  - Quantum::SuperPositions
name: Damian Conway
title: Thunder from Down Under
--- #YAML:1.0
hacks:
  - Inline
  - YAML
  - Inline::YAML
name: Brian Ingerson
nickname: ingy
END
