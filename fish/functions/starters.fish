function starters
    set starters Charmander Bulbasaur Squirtle Chikorita Cyndaquil Totodile Treecko Torchic Mudkip Turtwig Chimchar Piplup Snivy Tepig Oshawott Chespin Fennekin Froakie Rowlet Litten Popplio Grookey Scorbunny Sobble Pikachu
    set random_starter (random choice $starters)
    pokeget $random_starter --hide-name
end
