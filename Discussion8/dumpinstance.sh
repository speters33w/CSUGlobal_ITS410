\connect mysql://repluser@localhost:3306
util.dumpInstance("C:/MySQL_Backups", {dryRun: true, ocimds: true, excludeSchemas: ["ex"], compatibility: ["strip_definers", "strip_restricted_grants"]})
util.dumpInstance("C:/MySQL_Backups", {dryRun: false, ocimds: true, excludeSchemas: ["ex"], compatibility: ["strip_definers", "strip_restricted_grants"]})
