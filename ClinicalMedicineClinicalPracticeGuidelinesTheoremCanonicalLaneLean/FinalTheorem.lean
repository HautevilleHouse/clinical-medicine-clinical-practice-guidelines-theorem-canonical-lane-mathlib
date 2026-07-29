import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.CompartmentModel
import ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.DiagnosticInference
import ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.SurvivalAnalysis
import ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.Pharmacokinetics

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CompartmentModelClosed A.compartment ∧
  DiagnosticTestValid A.diagnostic ∧
  SurvivalModelValid A.survival ∧
  PharmacokineticModelValid A.pharmacokinetic

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- assume evidence fields in AdmissibleClass; construct proofs
  exact And.intro (compartment_model_closed_from_evidence A.compartment A.compartmentEvidence)
    (And.intro (diagnostic_valid_from_evidence A.diagnostic A.diagnosticEvidence)
      (And.intro (survival_valid_from_evidence A.survival A.survivalEvidence)
        (pk_valid_from_evidence A.pharmacokinetic A.pharmacokineticEvidence)))

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedClinicalMedicineClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_medicine_endgame (A : AdmissibleClass) :
    ConstrainedClinicalMedicineClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
