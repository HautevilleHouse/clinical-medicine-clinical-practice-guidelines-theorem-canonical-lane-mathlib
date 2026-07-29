import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

def ConstrainedClinicalMedicineClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_medicine_endgame (A : AdmissibleClass) :
    ConstrainedClinicalMedicineClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
