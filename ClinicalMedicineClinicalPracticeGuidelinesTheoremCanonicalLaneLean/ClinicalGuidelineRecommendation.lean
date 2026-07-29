import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.PharmacokineticCompartmentModel
import HautevilleHouse.ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.DiagnosticTestEvaluation
import HautevilleHouse.ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.SurvivalAnalysisCoxModel
import HautevilleHouse.ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.TherapeuticInterventionEffect

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

-- Clinical practice guideline recommendation integrating multiple evidence domains

structure ClinicalPracticeGuideline where
  recommendation : String
  evidenceStrength : String  -- e.g., "A" (strong), "B" (moderate), "C" (weak)
  pharmacokineticEvidence : PharmacokineticCompartmentModel
  diagnosticEvidence : DiagnosticTestEvaluation
  survivalEvidence : CoxProportionalHazardsModel
  therapeuticEvidence : TherapeuticInterventionEffect
  evidenceSynthesisValid : Prop

structure ClinicalGuidelineEvidence (G : ClinicalPracticeGuideline) where
  pharmacokineticClosed : PharmacokineticCompartmentClosed G.pharmacokineticEvidence
  diagnosticClosed : DiagnosticTestClosed G.diagnosticEvidence
  survivalClosed : CoxModelClosed G.survivalEvidence
  therapeuticClosed : TherapeuticInterventionClosed G.therapeuticEvidence
  evidenceSynthesisClosed : G.evidenceSynthesisValid

def ClinicalGuidelineClosed (G : ClinicalPracticeGuideline) : Prop :=
  PharmacokineticCompartmentClosed G.pharmacokineticEvidence ∧
  DiagnosticTestClosed G.diagnosticEvidence ∧
  CoxModelClosed G.survivalEvidence ∧
  TherapeuticInterventionClosed G.therapeuticEvidence ∧
  G.evidenceSynthesisValid

theorem clinical_guideline_closed_from_evidence (G : ClinicalPracticeGuideline)
    (E : ClinicalGuidelineEvidence G) : ClinicalGuidelineClosed G := by
  exact And.intro E.pharmacokineticClosed
    (And.intro E.diagnosticClosed
      (And.intro E.survivalClosed
        (And.intro E.therapeuticClosed E.evidenceSynthesisClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse