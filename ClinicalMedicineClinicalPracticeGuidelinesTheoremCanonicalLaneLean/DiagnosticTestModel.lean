import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure DiagnosticTestModelPackage where
  sensitivity : ℝ
  specificity : ℝ
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatioPositive : Prop
  likelihoodRatioNegative : Prop

structure DiagnosticTestModelEvidence (D : DiagnosticTestModelPackage) where
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioPositiveClosed : D.likelihoodRatioPositive
  likelihoodRatioNegativeClosed : D.likelihoodRatioNegative

def DiagnosticTestModelClosed (D : DiagnosticTestModelPackage) : Prop :=
  D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.likelihoodRatioPositive ∧ D.likelihoodRatioNegative

theorem diagnostic_test_model_closed_from_evidence (D : DiagnosticTestModelPackage) (E : DiagnosticTestModelEvidence D) :
    DiagnosticTestModelClosed D := by
  exact And.intro E.positivePredictiveValueClosed (And.intro E.negativePredictiveValueClosed (And.intro E.likelihoodRatioPositiveClosed E.likelihoodRatioNegativeClosed))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
