package Bencher::Scenario::LevenshteinModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark various modules calculating the Levenshtein edit distance',
    participants => [
        {
            fcall_template => "PERLANCAR::Text::Levenshtein::editdist(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::Levenshtein::fastdistance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::Levenshtein::XS::distance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::LevenshteinXS::distance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::Levenshtein::Damerau::PP::pp_edistance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::Levenshtein::Damerau::XS::xs_edistance(<word1>, <word2>)",
        },
    ],
    datasets => [
        { name=>"a",       args => {word1=>"a"      , word2=>"aa"},      result => 1 },
        { name=>"foo",     args => {word1=>"foo"    , word2=>"bar"},     result => 3 },
        { name=>"program", args => {word1=>"program", word2=>"porgram"}, result => 2 },
    ],
};

1;
# ABSTRACT:
