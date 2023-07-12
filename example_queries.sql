-- Which apprentices are associated with which wizards?
SELECT apprentices.first_name, apprentices.last_name, wizards.first_name AS wizard_first_name, wizards.last_name AS wizard_last_name
FROM apprentices
JOIN wizards ON apprentices.wizard_id = wizards.id;

-- Which realm does each wizard belong to?
SELECT wizards.first_name, wizards.last_name, realms.name AS realm_name
FROM wizards
JOIN realms ON wizards.realm_id = realms.id;

-- How many apprentices does each wizard have?
SELECT wizards.first_name, wizards.last_name, COUNT(apprentices.id) AS apprentice_count
FROM wizards
LEFT JOIN apprentices ON wizards.id = apprentices.wizard_id
GROUP BY wizards.first_name, wizards.last_name;

-- Which power/s does each wizard have?
SELECT wizards.first_name, wizards.last_name, powers.name AS power_name
FROM wizards
LEFT JOIN wizards_powers ON wizards.id = wizards_powers.wizards_id
LEFT JOIN powers ON wizards_powers.powers_id = powers.id
ORDER BY wizards.first_name;