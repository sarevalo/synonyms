SELECT *
FROM words t1
LEFT OUTER JOIN synonyms t2
ON t1.id = t2.word_id
WHERE t1.reference = 'conocer'