import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure SurvivalAnalysisModelPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop

structure SurvivalAnalysisModelEvidence (S : SurvivalAnalysisModelPackage) where
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisModelClosed (S : SurvivalAnalysisModelPackage) : Prop :=
  S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.logRankTest

theorem survival_analysis_model_closed_from_evidence (S : SurvivalAnalysisModelPackage) (E : SurvivalAnalysisModelEvidence S) :
    SurvivalAnalysisModelClosed S := by
  exact And.intro E.kaplanMeierEstimatorClosed (And.intro E.coxProportionalHazardsClosed E.logRankTestClosed)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
