import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

-- Therapeutic intervention effect estimation: absolute risk reduction, number needed to treat

structure TherapeuticInterventionEffect where
  controlEventRate : Float
  treatmentEventRate : Float
  absoluteRiskReduction : Float  -- controlEventRate - treatmentEventRate
  numberNeededToTreat : Float     -- 1 / absoluteRiskReduction (if positive)
  benefitStatisticallySignificant : Prop
  effectSizeValid : Prop

structure TherapeuticInterventionEvidence (I : TherapeuticInterventionEffect) where
  ratesPositive : I.controlEventRate > 0 ∧ I.treatmentEventRate > 0
  absoluteRiskReductionDerived : I.absoluteRiskReduction = I.controlEventRate - I.treatmentEventRate
  numberNeededToTreatDerived : I.numberNeededToTreat = 1 / (I.controlEventRate - I.treatmentEventRate)
  benefitSignificantClosed : I.benefitStatisticallySignificant
  effectSizeValidClosed : I.effectSizeValid

def TherapeuticInterventionClosed (I : TherapeuticInterventionEffect) : Prop :=
  (I.controlEventRate > 0 ∧ I.treatmentEventRate > 0) ∧
  I.absoluteRiskReduction = I.controlEventRate - I.treatmentEventRate ∧
  I.numberNeededToTreat = 1 / (I.controlEventRate - I.treatmentEventRate) ∧
  I.benefitStatisticallySignificant ∧ I.effectSizeValid

theorem therapeutic_intervention_closed_from_evidence
    (I : TherapeuticInterventionEffect) (E : TherapeuticInterventionEvidence I) :
    TherapeuticInterventionClosed I := by
  have h_rates := E.ratesPositive
  exact And.intro h_rates
    (And.intro E.absoluteRiskReductionDerived
      (And.intro E.numberNeededToTreatDerived
        (And.intro E.benefitSignificantClosed E.effectSizeValidClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse