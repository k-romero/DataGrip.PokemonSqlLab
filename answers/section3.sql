/*What is each pokemon's primary type?*/
SELECT pokemons.name, types.name
FROM pokemons, types
WHERE pokemons.primary_type = types.id
ORDER BY types.name,pokemons.name;

/*What is Rufflet's secondary type?*/
SELECT pokemons.name, types.name
FROM pokemons, types
WHERE pokemons.name = 'Rufflet' AND pokemons.secondary_type = types.id;

/*What are the names of the pokemon that belong to the trainer with trainerID 303?*/
SELECT pokemons.name
FROM pokemon_trainer, pokemons
WHERE pokemon_trainer.trainerid = 303 AND pokemon_trainer.pokemon_id = pokemons.id
ORDER BY name;

/*How many pokemon have a secondary type Poison*/
SELECT COUNT (*)
FROM pokemons, types
WHERE pokemons.secondary_type = types.id AND types.name = 'Poison';

/*What are all the primary types and how many pokemon have that type?*/
SELECT DISTINCT pokemons.primary_type, types.name, COUNT(*)
FROM types, pokemons
WHERE types.id = pokemons.primary_type
GROUP BY pokemons.primary_type, types.name
ORDER BY pokemons.primary_type;

/*How many pokemon at level 100 does each trainer with at least one level 100 pokemon have?
Hint: your query should not display a trainer*/
SELECT pokemons.name, pokemon_trainer.pokelevel, COUNT(*)
FROM pokemon_trainer, pokemons
WHERE pokemon_trainer.pokemon_id = pokemons.id AND pokelevel = 100
GROUP BY pokemons.name, pokemon_trainer.pokelevel
ORDER BY COUNT,pokemons.name;

/*How many pokemon only belong to one trainer and no other?*/
SELECT pokemons.name, COUNT (*)
FROM pokemons, pokemon_trainer, trainers
WHERE pokemons.id = pokemon_trainer.pokemon_id AND pokemon_trainer.trainerid = trainers.trainerid
GROUP BY pokemons.name
HAVING COUNT(*) = 1;
