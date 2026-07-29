import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Type u
  transitionRates : Type v
  initialConcentration : compartments → ℝ
  decayConstant : ℝ
  steadyState : Prop
  wellMixed : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  decayConstantPositive : C.decayConstant > 0
  initialConcentrationNonnegative : ∀ x, C.initialConcentration x ≥ 0
  steadyStateReached : C.steadyState
  wellMixedAssumptionHolds : C.wellMixed

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.steadyState ∧ C.wellMixed

theorem compartment_model_closed_from_evidence (C : CompartmentModel)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.steadyStateReached E.wellMixedAssumptionHolds

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
