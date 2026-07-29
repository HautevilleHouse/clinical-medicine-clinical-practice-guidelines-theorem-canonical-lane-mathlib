import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure GuidelineRecommendationPackage where
  strengthOfRecommendation : Prop
  qualityOfEvidence : Prop
  benefitHarmBalance : Prop
  patientValuesPreferences : Prop
  resourceConsiderations : Prop

structure GuidelineRecommendationEvidence (G : GuidelineRecommendationPackage) where
  strengthOfRecommendationClosed : G.strengthOfRecommendation
  qualityOfEvidenceClosed : G.qualityOfEvidence
  benefitHarmBalanceClosed : G.benefitHarmBalance
  patientValuesPreferencesClosed : G.patientValuesPreferences
  resourceConsiderationsClosed : G.resourceConsiderations

def GuidelineRecommendationClosed (G : GuidelineRecommendationPackage) : Prop :=
  G.strengthOfRecommendation ∧ G.qualityOfEvidence ∧ G.benefitHarmBalance ∧ G.patientValuesPreferences ∧ G.resourceConsiderations

theorem guideline_recommendation_closed_from_evidence (G : GuidelineRecommendationPackage) (E : GuidelineRecommendationEvidence G) :
    GuidelineRecommendationClosed G := by
  exact And.intro E.strengthOfRecommendationClosed (And.intro E.qualityOfEvidenceClosed (And.intro E.benefitHarmBalanceClosed (And.intro E.patientValuesPreferencesClosed E.resourceConsiderationsClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse