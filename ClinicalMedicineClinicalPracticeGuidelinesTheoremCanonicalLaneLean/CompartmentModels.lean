import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : List String
  transitionRates : List (Nat × Nat × Float)
  initialConditions : List (String × Float)
  timeDependent : Bool

structure CompartmentModelEvidence (C : CompartmentModel) where
  compartmentsClosed : C.compartments ≠ []
  transitionRatesClosed : C.transitionRates ≠ []
  initialConditionsClosed : C.initialConditions ≠ []
  wellDefined : Prop

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.compartments ≠ [] ∧ C.transitionRates ≠ [] ∧ C.initialConditions ≠ []

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.compartmentsClosed (And.intro E.transitionRatesClosed E.initialConditionsClosed)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
