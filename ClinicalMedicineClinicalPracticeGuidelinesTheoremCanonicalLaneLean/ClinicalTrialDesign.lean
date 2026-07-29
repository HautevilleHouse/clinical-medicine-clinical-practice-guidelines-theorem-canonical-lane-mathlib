import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  randomizationProcedure : Prop
  blindingMethod : Prop
  sampleSizeCalculation : Prop
  primaryEndpoint : Prop
  statisticalAnalysisPlan : Prop

structure ClinicalTrialDesignEvidence (C : ClinicalTrialDesignPackage) where
  randomizationProcedureClosed : C.randomizationProcedure
  blindingMethodClosed : C.blindingMethod
  sampleSizeCalculationClosed : C.sampleSizeCalculation
  primaryEndpointClosed : C.primaryEndpoint
  statisticalAnalysisPlanClosed : C.statisticalAnalysisPlan

def ClinicalTrialDesignClosed (C : ClinicalTrialDesignPackage) : Prop :=
  C.randomizationProcedure ∧ C.blindingMethod ∧ C.sampleSizeCalculation ∧ C.primaryEndpoint ∧ C.statisticalAnalysisPlan

theorem clinical_trial_design_closed_from_evidence (C : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence C) :
    ClinicalTrialDesignClosed C := by
  exact And.intro E.randomizationProcedureClosed (And.intro E.blindingMethodClosed (And.intro E.sampleSizeCalculationClosed (And.intro E.primaryEndpointClosed E.statisticalAnalysisPlanClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse