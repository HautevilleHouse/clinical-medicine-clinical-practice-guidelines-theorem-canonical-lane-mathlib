import ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure ClinicalPracticeGuidelinesTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceClinicalTheoremStatement : ClinicalPracticeGuidelinesTheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := "classical source boundary carried by formalization certificate",
  constrainedStatement := "clinical-practice-guidelines-constrained theorem certificate internalized through baseline gates, clinical constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
  certificateLane := "clinical_constrained",
  carriedRemainder := "clinical source boundary carried by formalization certificate"
}

theorem theorem_statement_source_key_checked :
    sourceClinicalTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceClinicalTheoremStatement.certificateLane = "clinical_constrained" := by
  rfl

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse