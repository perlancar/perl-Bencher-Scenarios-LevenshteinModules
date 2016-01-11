package Bencher::Scenario::LevenshteinModules;

# DATE
# VERSION

use 5.010001;
use strict;
use utf8;
use warnings;

our $scenario = {
    summary => 'Benchmark various modules calculating the Levenshtein edit distance',
    modules => {
        'Text::Levenshtein' => 0.11,
    },
    participants => [
        {
            fcall_template => "PERLANCAR::Text::Levenshtein::editdist(<word1>, <word2>)",
            tags => ['no_unicode_support'],
        },
        {
            fcall_template => "Text::Levenshtein::fastdistance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::Levenshtein::XS::distance(<word1>, <word2>)",
        },
        {
            fcall_template => "Text::LevenshteinXS::distance(<word1>, <word2>)",
            tags => ['no_unicode_support'],
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
        { name=>"reve"   , args => {word1=>"reve"   , word2=>"rêves"},   result => 3, tags=>['unicode'], exclude_participant_tags=>['no_unicode_support'] },
        { name=>"euro"   , args => {word1=>"Euro"   , word2=>"€uro"},    result => 1, tags=>['unicode'], exclude_participant_tags=>['no_unicode_support'] },
    ],
    on_result_failure => 'warn',
};

1;
# ABSTRACT:
