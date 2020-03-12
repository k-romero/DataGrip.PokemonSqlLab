/*
Directions: Write a query that returns the following columns:
-------------------------------------------------------------------------------
Pokemon Name:Pokemon's name
Trainer Name:Trainer's name
Level:Current level
Primary Type:Primary Type Name
Secondary Type:Secondary Type Name
-------------------------------------------------------------------------------
Sort the data by finding out which trainer has the strongest pokemon so that
this will act as a ranking of strongest to weakest trainer. You may interpret
strongest in whatever way you want, but you will have to explain your decision.
*/

/*First Attempt*/
SELECT trainers.trainername, pokelevel,(hp+maxhp+attack+defense+spatk+spdef+speed) AS total
FROM pokemon_trainer, trainers,pokemons
WHERE pokemon_trainer.trainerid = trainers.trainerid AND pokemon_trainer.pokemon_id = pokemons.id
GROUP BY pokemon_trainer.trainerid,pokemon_trainer.pokelevel,trainers.trainername,total
ORDER BY total DESC;

/*Second Attempt*/
SELECT (hp+maxhp+attack+defense+spatk+spdef+speed) AS total,
pokemons.name AS pname,
trainers.trainername AS tname,
pokemon_trainer.pokelevel AS plvl,types.name, pokemons.secondary_type
FROM pokemon_trainer
JOIN pokemons ON pokemon_trainer.pokemon_id=pokemons.id
JOIN trainers ON pokemon_trainer.trainerid=trainers.trainerid
RIGHT JOIN types ON pokemons.primary_type=types.id
ORDER BY total DESC;

/*Third & Final attempt...for now :)
Finally managed to include pokemon who do not have a secondary type and list them
in conjunction with my ranking system. Additionally I changed the way I wanted to
rank them from simply summing up their stats to averaging their stats for each Pokemon
included in the table is a column which lists their stat average.
*/
SELECT (hp+maxhp+attack+defense+spatk+spdef+speed) /7 AS Total_Stats,
pokemons.name AS Pokemon_Name,
trainers.trainername AS Trainer_Name,
pokemon_trainer.pokelevel AS Pokemon_Level,
t.name AS Primary_Type,
st.name AS Secondary_Type
FROM pokemon_trainer
JOIN pokemons ON pokemon_trainer.pokemon_id=pokemons.id
JOIN trainers ON pokemon_trainer.trainerid=trainers.trainerid
RIGHT JOIN types as t ON pokemons.primary_type=t.id
LEFT JOIN types as st ON pokemons.secondary_type=st.id
ORDER BY Total_Stats DESC;
