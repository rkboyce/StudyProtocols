-- query-to-get-count-of-males-and-females-being-prescribed-any-drug-using-age-at-exposure

SELECT CONCEPT.concept_name, COUNT(DISTINCT(PERSON.person_id))
FROM DRUG_EXPOSURE,  PERSON, CONCEPT
WHERE DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE >= DATE '2010-10-01'
AND   DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE <= DATE '2014-01-31'
AND   DRUG_EXPOSURE.person_id = PERSON.person_id 
AND   PERSON.gender_concept_id = CONCEPT.concept_id
AND   (YEAR(DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE) - PERSON.year_of_birth >= 0)
AND   (YEAR(DRUG_EXPOSURE.DRUG_EXPOSURE_START_DATE) - PERSON.year_of_birth <= 13)
GROUP BY CONCEPT.concept_name
ORDER BY CONCEPT.concept_name



