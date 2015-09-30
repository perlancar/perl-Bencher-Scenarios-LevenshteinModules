package Bench::Scenario::LevenshteinModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    items => [
        {
            type     => 'function_call',
            template => "PERLANCAR::Text::Levenshtein::editdist(<arg>)"
        },
        {
            type     => 'function_call',
            template => "Text::Levenshtein::fastdistance(<arg>)",
        },
        {
            type     => 'function_call',
            template => "Text::Levenshtein::XS::distance(<arg>)",
        },
        {
            type     => 'function_call',
            template => "Text::LevenshteinXS::distance(<arg>)",
        },
    ],
};

1;
# ABSTRACT: Benchmark various modules calculating the Levenshtein edit distance
