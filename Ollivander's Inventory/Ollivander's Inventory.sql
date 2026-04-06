select w.id,wp.age,w.coins_needed,w.power from wands w 
join wands_property wp on w.code=wp.code
WHERE 
    wp.is_evil = 0               -- only non-evil wands
    AND w.coins_needed = (       --only minimum coins
        SELECT MIN(w2.coins_needed)
        FROM Wands w2
        JOIN Wands_Property wp2 ON w2.code = wp2.code
        WHERE w2.power = w.power -- same power
        AND wp2.age = wp.age     -- same age
        AND wp2.is_evil = 0      -- also non-evil
    )
ORDER BY 
    w.power DESC,                -- highest power first
    wp.age DESC                  -- if same power, older first
