package Bench::Scenario::LevenshteinModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
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
    ],
    data_sets => [
        { args => {word1=>"a"      , word2=>"aa"},      result => 1 },
        { args => {word1=>"foo"    , word2=>"bar"},     result => 3 },
        { args => {word1=>"program", word2=>"porgram"}, result => 2 },
    ],
};

1;
# ABSTRACT: Benchmark various modules calculating the Levenshtein edit distance
