import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  likelihoodRatioPositive : ℝ
  likelihoodRatioNegative : ℝ

structure DiagnosticEvidence (D : DiagnosticTest) where
  sensitivityValid : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityValid : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  prevalenceValid : 0 ≤ D.prevalence ∧ D.prevalence ≤ 1
  ppvDerived : D.positivePredictiveValue = (D.sensitivity * D.prevalence) / (D.sensitivity * D.prevalence + (1 - D.specificity) * (1 - D.prevalence))
  npvDerived : D.negativePredictiveValue = (D.specificity * (1 - D.prevalence)) / ((1 - D.sensitivity) * D.prevalence + D.specificity * (1 - D.prevalence))

def DiagnosticTestValid (D : DiagnosticTest) : Prop :=
  (0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1) ∧
  (0 ≤ D.specificity ∧ D.specificity ≤ 1) ∧
  (0 ≤ D.prevalence ∧ D.prevalence ≤ 1)

theorem diagnostic_valid_from_evidence (D : DiagnosticTest) (E : DiagnosticEvidence D) :
    DiagnosticTestValid D := by
  exact And.intro E.sensitivityValid (And.intro E.specificityValid E.prevalenceValid)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
