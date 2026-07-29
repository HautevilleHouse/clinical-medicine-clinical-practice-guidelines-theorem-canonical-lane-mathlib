import HautevilleHouse.ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClinicalGuidelineClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.evidenceSynthesisValid  -- placeholder, actual proof uses evidence

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse