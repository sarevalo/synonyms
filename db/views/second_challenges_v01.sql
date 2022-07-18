-- In this case we can know how many synonyms each word has

SELECT t1.reference, COUNT(t2.word_id) number
FROM words t1
LEFT OUTER JOIN synonyms t2
ON t1.id = t2.word_id
WHERE t1.reference = 'conocer'
AND t1.status = 1
GROUP BY t1.reference