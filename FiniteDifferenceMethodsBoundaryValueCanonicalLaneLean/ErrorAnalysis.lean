import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure ErrorAnalysisPackage where
  truncationErrorUniformBound : Prop
  stabilityFactorIndependentOfMesh : Prop
  convergenceRateKnown : Nat
  prioriEstimate : Prop

structure ErrorAnalysisEvidence (E : ErrorAnalysisPackage) where
  truncationErrorUniformBoundClosed : E.truncationErrorUniformBound
  stabilityFactorIndependentOfMeshClosed : E.stabilityFactorIndependentOfMesh
  prioriEstimateClosed : E.prioriEstimate

def ErrorAnalysisClosed (E : ErrorAnalysisPackage) : Prop :=
  E.truncationErrorUniformBound ∧ E.stabilityFactorIndependentOfMesh ∧ E.prioriEstimate

theorem error_analysis_closed_from_evidence (E : ErrorAnalysisPackage) (Ev : ErrorAnalysisEvidence E) :
    ErrorAnalysisClosed E := by
  exact And.intro Ev.truncationErrorUniformBoundClosed
    (And.intro Ev.stabilityFactorIndependentOfMeshClosed Ev.prioriEstimateClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
