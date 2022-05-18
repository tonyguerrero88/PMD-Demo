BEGIN
FOR c1 IN (SELECT * FROM companies) LOOP
  FOR c2 IN (SELECT * FROM contacts) LOOP
    FOR c3 IN (SELECT * FROM parties) LOOP
      NULL;
    END LOOP;
  END LOOP;
END LOOP;
END;
/