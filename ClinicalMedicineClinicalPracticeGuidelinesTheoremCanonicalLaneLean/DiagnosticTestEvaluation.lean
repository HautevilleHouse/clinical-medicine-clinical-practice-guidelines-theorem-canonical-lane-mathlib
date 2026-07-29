import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

-- Diagnostic test evaluation: sensitivity, specificity, predictive values

structure DiagnosticTestEvaluation where
  sensitivity : Float
  specificity : Float
  prevalence : Float
  positivePredictiveValue : Float  -- derived
  negativePredictiveValue : Float  -- derived
  sensitivityValid : Prop
  specificityValid : Prop
  prevalenceValid : Prop
  ppvCalculated : positivePredictiveValue = (sensitivity * prevalence) / (sensitivity * prevalence + (1 - specificity) * (1 - prevalence))
  npvCalculated : negativePredictiveValue = (specificity * (1 - prevalence)) / ((1 - sensitivity) * prevalence + specificity * (1 - prevalence))

structure DiagnosticTestEvidence (D : DiagnosticTestEvaluation) where
  sensitivityClosed : D.sensitivityValid
  specificityClosed : D.specificityValid
  prevalenceClosed : D.prevalenceValid
  ppvClosed : D.ppvCalculated
  npvClosed : D.npvCalculated

def DiagnosticTestClosed (D : DiagnosticTestEvaluation) : Prop :=
  D.sensitivityValid ∧ D.specificityValid ∧ D.prevalenceValid ∧ D.ppvCalculated ∧ D.npvCalculated

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestEvaluation)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.prevalenceClosed
        (And.intro E.ppvClosed E.npvClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse