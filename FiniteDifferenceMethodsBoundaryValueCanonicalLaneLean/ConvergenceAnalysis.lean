import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure ConvergenceAnalysisPackage where
  meshFamily : Type u
  discreteSolution : Type v
  exactSolution : Type w
  consistencyEstimate : Prop
  stabilityEstimate : Prop
  convergenceRate : Float

structure ConvergenceAnalysisEvidence (C : ConvergenceAnalysisPackage) where
  consistencyEstimateClosed : C.consistencyEstimate
  stabilityEstimateClosed : C.stabilityEstimate

def ConvergenceAnalysisClosed (C : ConvergenceAnalysisPackage) : Prop :=
  C.consistencyEstimate ∧ C.stabilityEstimate

theorem convergence_analysis_closed_from_evidence
    (C : ConvergenceAnalysisPackage) (E : ConvergenceAnalysisEvidence C) :
    ConvergenceAnalysisClosed C := by
  exact And.intro E.consistencyEstimateClosed E.stabilityEstimateClosed

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse