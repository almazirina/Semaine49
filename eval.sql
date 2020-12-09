DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT DISTINCT numfou FROM entcom;
END |

DELIMITER ;




DELIMITER |

CREATE PROCEDURE Lst_Commandes(IN p_libelle VARCHAR(50))

BEGIN
   SELECT numcom, datcom, numfou
   FROM entcom
   WHERE p_libelle=obscom;
END |

DELIMITER ;