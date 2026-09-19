# Script is only useful for displaying random legendaries.
# If you want a specific legendary, use pokeget on its own.
function legendaries
    set -l kanto_legendaries Articuno Zapdos Moltres Mewtwo Mew
    set -l johto_legendaries Raikou Entei Suicune Lugia Ho-Oh Celebi
    set -l hoenn_legendaries\
        Regirock\
        Regice\
        Registeel\
        Latias\
        Latios\
        Kyogre\
        Groudon\
        Rayquaza\
        Jirachi\
        Deoxys
    set -l sinnoh_legendaries\
        Uxie\
        Mesprit\
        Azelf\
        Dialga\
        Palkia\
        Heatran\
        Regigigas\
        Giratina\
        Cresselia\
        Phione\
        Manaphy\
        Darkrai\
        Shaymin\
        Arceus
    set -l unova_legendaries\
        Cobalion\
        Terrakion\
        Virizion\
        Tornadus\
        Reshiram\
        Zekrom\
        Landorus\
        Kyurem\
        Victini\
        Keldeo\
        Meloetta\
        Genesect
    set -l kalos_legendaries Xerneas Yveltal Zygarde Diancie Hoopa Volcanion
    set -l alola_legendaries\
        Type_Null\
        Silvally\
        Tapu_Koko\
        Tapu_Lele\
        Tapu_Bulu\
        Tapu_Fini\
        Cosmog\
        Cosmoem\
        Solgaleo\
        Lunala\
        Necrozma\
        Magearna\
        Marshadow\
        Zeraora\
        Meltan\
        Melmetal
    set -l galar_legendaries\
        Zacian\
        Zamazenta\
        Eternatus\
        Kubfu\
        Urshifu\
        Regieleki\
        Regidrago\
        Glastrier\
        Spectrier\
        Calyrex\
        Enamorus\
        Zarude


    set -l options 'k/kanto' 'j/johto' 'h/hoenn' 's/sinnoh' 'u/unova' 'x/kalos' 'a/alola' 'g/galar'
    argparse $options -- $argv
    or return 1

    set -l chosen_pokemon

    if set -q _flag_kanto
        set chosen_pokemon (random choice $kanto_legendaries)
    else if set -q _flag_johto
       set chosen_pokemon (random choice $kanto_legendaries)
    else if set -q _flag_hoenn
        set chosen_pokemon (random choice $hoenn_legendaries)
    else if set -q _flag_sinnoh
        set chosen_pokemon (random choice $sinnoh_legendaries)
    else if set -q _flag_unova
        set chosen_pokemon (random choice $unova_legendaries)
    else if set -q _flag_kalos
        set chosen_pokemon (random choice $kalos_legendaries)
    else if set -q _flag_alola
        set chosen_pokemon (random choice $alola_legendaries)
    else if set -q _flag_galar
        set chosen_pokemon (random choice $galar_legendaries)
    else
        set -l all_legendaries\
            $kanto_legendaries\
            $johto_legendaries\
            $hoenn_legendaries\
            $sinnoh_legendaries\
            $unova_legendaries\
            $kalos_legendaries\
            $alola_legendaries\
            $galar_legendaries
        set chosen_pokemon (random choice $all_legendaries)

    end
    echo "$chosen_pokemon"
    pokeget $chosen_pokemon --hide-name
end
