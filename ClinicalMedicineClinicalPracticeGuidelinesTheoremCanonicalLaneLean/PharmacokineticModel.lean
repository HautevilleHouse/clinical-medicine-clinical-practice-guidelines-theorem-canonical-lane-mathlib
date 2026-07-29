import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure PharmacokineticModelPackage where
  halfLife : ℝ
  clearance : ℝ
  volumeOfDistribution : ℝ
  bioavailability : Prop
  firstOrderKinetics : Prop
  steadyStateConcentration : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  bioavailabilityClosed : P.bioavailability
  firstOrderKineticsClosed : P.firstOrderKinetics
  steadyStateConcentrationClosed : P.steadyStateConcentration

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.bioavailability ∧ P.firstOrderKinetics ∧ P.steadyStateConcentration

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.bioavailabilityClosed (And.intro E.firstOrderKineticsClosed E.steadyStateConcentrationClosed)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
