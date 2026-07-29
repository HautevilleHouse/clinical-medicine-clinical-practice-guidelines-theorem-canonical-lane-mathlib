import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean

structure EvidenceSynthesisPackage where
  systematicReviewMethod : Prop
  metaAnalysisModel : Prop
  heterogeneityAssessment : Prop
  publicationBiasEvaluation : Prop
  gradeAssessment : Prop

structure EvidenceSynthesisEvidence (E : EvidenceSynthesisPackage) where
  systematicReviewMethodClosed : E.systematicReviewMethod
  metaAnalysisModelClosed : E.metaAnalysisModel
  heterogeneityAssessmentClosed : E.heterogeneityAssessment
  publicationBiasEvaluationClosed : E.publicationBiasEvaluation
  gradeAssessmentClosed : E.gradeAssessment

def EvidenceSynthesisClosed (E : EvidenceSynthesisPackage) : Prop :=
  E.systematicReviewMethod ∧ E.metaAnalysisModel ∧ E.heterogeneityAssessment ∧ E.publicationBiasEvaluation ∧ E.gradeAssessment

theorem evidence_synthesis_closed_from_evidence (E : EvidenceSynthesisPackage) (Ev : EvidenceSynthesisEvidence E) :
    EvidenceSynthesisClosed E := by
  exact And.intro Ev.systematicReviewMethodClosed (And.intro Ev.metaAnalysisModelClosed (And.intro Ev.heterogeneityAssessmentClosed (And.intro Ev.publicationBiasEvaluationClosed Ev.gradeAssessmentClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesTheoremCanonicalLaneLean
end HautevilleHouse