import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure ClinicalRecommendation where
  grade : String
  evidenceLevel : String
  recommendationText : String

structure ClinicalGuideline where
  title : String
  recommendations : List ClinicalRecommendation
  methodology : String

structure ClinicalGuidelineEvidence (G : ClinicalGuideline) where
  recommendationsNotEmpty : G.recommendations ≠ []
  methodologySpecified : G.methodology ≠ ""

def ClinicalGuidelineClosed (G : ClinicalGuideline) : Prop :=
  G.recommendations ≠ [] ∧ G.methodology ≠ ""

theorem clinical_guideline_closed_from_evidence (G : ClinicalGuideline) (E : ClinicalGuidelineEvidence G) : ClinicalGuidelineClosed G := by
  exact And.intro E.recommendationsNotEmpty E.methodologySpecified

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
