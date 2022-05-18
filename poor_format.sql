BEGIN
  SELECT cmer_id
        ,version
        ,cmp_id
    BULK COLLECT INTO v_cmer_ids
        ,v_versions
        ,v_cmp_ids
    FROM cmer;

  PROCEDURE create_prospect(
    company_info_in      IN    prospects.company_info%TYPE -- Organization
   ,firstname_in         IN    persons.firstname%TYPE      -- FirstName
   ,lastname_in          IN    persons.lastname%TYPE       -- LastName
  );
  
  webcrm_marketing.prospect_ins(
    cmp_id_in            => NULL
   ,company_info_in      => company_info_in
   ,firstname_in         => firstname_in
   ,lastname_in          => lastname_in
   ,slt_code_in          => NULL
  );

END;