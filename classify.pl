use strict;
use utf8;

my %tags = (
        "wspolnota mieszkaniowa" => "Czynsz",
        "dalkia" => "Veolia",
        "veolia" => "Veolia",
        "enea"  => "Enea",
        "ikea"  => "Ikea",
        "inea" => "Inea",
        "north fish" => "Knajpy",
        "cukiernia" => "Knajpy",
        "kawiarnia" => "Knajpy",
        "burger" => "Knajpy",
        "apteka"  => "Leki",
        "oszczednosci" => "Oszczednosci",
        "lotos" => "Paliwo",
        "orlen" => "Paliwo",
        "stacja paliw" => "Paliwo",
        "biedronka" => "Zakupy",
        "lidl" => "Zakupy",
        "chata polska" => "Zakupy",
        "tesco" => "Zakupy",
        "zabka" => "Zakupy",
        "carrefour" => "Zakupy",
        "market" => "Zakupy",
        "akademia smyka" => "Zlobek",
        "odsetki" => "Spłata kredytu",

        "ams " => "Samochód",
        "lnota mieszkaniowa" => "Czynsz",


## todo: pizza , pizzeria, hut,
## dom lekow,
## piotr i pawel

    );

start();

## Tagowanie budzetu domowego

#AGD
#Czynsz
#Dalkia
#Enea
#Ikea
#Inea
#Inne
#Knajpy
#Leki
#Oszczędności
#Paliwo
#Prezenty
#Samochód
#Spłata kredytu
#Ubezpieczenie
#Wypłata gotówki
#Zakupy
#Zdrowie


sub start
{
    open(IN, "budzet.csv");
    my $l;
    my $lc;
    my $notFound;

    while ($l = <IN>) {
        chomp $l;
        $lc = $l;
        $lc =~ tr/A-Z/a-z/;
        $notFound = 1;
        my @keys = keys %tags;
        my $i = 0;
        my $value;
        while ($notFound && ($keys[$i])) {
            $value = $tags{$keys[$i]};
            if ($lc =~ /$keys[$i]/i) {
                print $l . "," . $value, "\n";
                $notFound = 0;
            } else {
#                print "-d: $keys[$i] - $value \n";
            }
            $i++;
        }
        if ($notFound) {
            print $lc . "," . "Inne\n";
        }
    }

    close IN;
}
