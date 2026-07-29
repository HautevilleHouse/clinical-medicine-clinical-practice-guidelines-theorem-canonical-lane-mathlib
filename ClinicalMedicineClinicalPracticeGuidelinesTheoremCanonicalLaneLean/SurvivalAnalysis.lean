import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  cumulativeHazard : ℝ → ℝ
  medianSurvivalTime : ℝ
  censoringIndicator : Prop

def hazardToSurvival (h : ℝ → ℝ) (t : ℝ) : ℝ :=
  Real.exp (-∫ s in (0:ℝ)..t, h s)

structure SurvivalEvidence (S : SurvivalModel) where
  survivalDerived : ∀ t, S.survivalFunction t = hazardToSurvival S.hazardFunction t
  cumulativeHazardDerived : ∀ t, S.cumulativeHazard t = ∫ s in (0:ℝ)..t, S.hazardFunction s
  medianSurvivalPositive : S.medianSurvivalTime > 0
  censoringHandled : S.censoringIndicator

def SurvivalModelValid (S : SurvivalModel) : Prop :=
  (∀ t, S.survivalFunction t = hazardToSurvival S.hazardFunction t) ∧
  (∀ t, S.cumulativeHazard t = ∫ s in (0:ℝ)..t, S.hazardFunction s) ∧
  S.medianSurvivalTime > 0

theorem survival_valid_from_evidence (S : SurvivalModel) (E : SurvivalEvidence S) :
    SurvivalModelValid S := by
  exact And.intro E.survivalDerived (And.intro E.cumulativeHazardDerived E.medianSurvivalPositive)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
