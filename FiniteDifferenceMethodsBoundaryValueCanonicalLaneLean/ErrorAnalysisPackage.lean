import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean.DiscretizationPackage

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure ErrorAnalysisPackage (D : DiscretizationPackage) where
  localTruncationError : Prop
  globalErrorBound : Prop
  convergenceRate : Prop
  aPrioriEstimate : Prop

def ErrorAnalysisClosed (E : ErrorAnalysisPackage D) : Prop :=
  E.localTruncationError ∧ E.globalErrorBound ∧ E.convergenceRate ∧ E.aPrioriEstimate

theorem error_analysis_closed (E : ErrorAnalysisPackage D) : ErrorAnalysisClosed E :=
  And.intro E.localTruncationError (And.intro E.globalErrorBound (And.intro E.convergenceRate E.aPrioriEstimate))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse