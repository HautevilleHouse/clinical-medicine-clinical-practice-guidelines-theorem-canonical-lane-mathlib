import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure PharmacokineticModel where
  dose : ℝ
  volumeOfDistribution : ℝ
  clearance : ℝ
  halfLife : ℝ
  areaUnderCurve : ℝ
  peakConcentration : ℝ

def halfLifeFromClearance (Vd Cl : ℝ) : ℝ :=
  (Real.log 2) * Vd / Cl

struct PharmacokineticEvidence (P : PharmacokineticModel) where
  dosePositive : P.dose > 0
  volumePositive : P.volumeOfDistribution > 0
  clearancePositive : P.clearance > 0
  halfLifeDerived : P.halfLife = halfLifeFromClearance P.volumeOfDistribution P.clearance
  aucDerived : P.areaUnderCurve = P.dose / P.clearance

def PharmacokineticModelValid (P : PharmacokineticModel) : Prop :=
  P.dose > 0 ∧ P.volumeOfDistribution > 0 ∧ P.clearance > 0 ∧
  P.halfLife = halfLifeFromClearance P.volumeOfDistribution P.clearance ∧
  P.areaUnderCurve = P.dose / P.clearance

theorem pk_valid_from_evidence (P : PharmacokineticModel) (E : PharmacokineticEvidence P) :
    PharmacokineticModelValid P := by
  exact And.intro E.dosePositive (And.intro E.volumePositive (And.intro E.clearancePositive
    (And.intro E.halfLifeDerived E.aucDerived)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
