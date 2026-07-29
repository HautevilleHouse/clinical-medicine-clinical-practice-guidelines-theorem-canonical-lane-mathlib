import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Float
  eliminationRate : Float
  volumeDistribution : Float
  doseRegimen : List (Float × Float)

structure PharmacokineticModelEvidence (P : PharmacokineticModel) where
  absorptionRateClosed : P.absorptionRate > 0
  eliminationRateClosed : P.eliminationRate > 0
  volumeDistributionClosed : P.volumeDistribution > 0
  doseRegimenClosed : P.doseRegimen ≠ []

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.absorptionRate > 0 ∧ P.eliminationRate > 0 ∧ P.volumeDistribution > 0 ∧ P.doseRegimen ≠ []

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed (And.intro E.eliminationRateClosed (And.intro E.volumeDistributionClosed E.doseRegimenClosed))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
