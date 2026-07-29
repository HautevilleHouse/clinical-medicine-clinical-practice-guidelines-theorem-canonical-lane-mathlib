import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure TherapeuticIntervention where
  drugName : String
  dosage : Float
  frequency : String
  route : String
  indication : String

structure TherapeuticInterventionEvidence (T : TherapeuticIntervention) where
  drugNameClosed : T.drugName ≠ ""
  dosageClosed : T.dosage > 0
  frequencyClosed : T.frequency ≠ ""
  routeClosed : T.route ≠ ""
  indicationClosed : T.indication ≠ ""

def TherapeuticInterventionClosed (T : TherapeuticIntervention) : Prop :=
  T.drugName ≠ "" ∧ T.dosage > 0 ∧ T.frequency ≠ "" ∧ T.route ≠ "" ∧ T.indication ≠ ""

theorem therapeutic_intervention_closed_from_evidence (T : TherapeuticIntervention) (E : TherapeuticInterventionEvidence T) : TherapeuticInterventionClosed T := by
  exact And.intro E.drugNameClosed (And.intro E.dosageClosed (And.intro E.frequencyClosed (And.intro E.routeClosed E.indicationClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse
