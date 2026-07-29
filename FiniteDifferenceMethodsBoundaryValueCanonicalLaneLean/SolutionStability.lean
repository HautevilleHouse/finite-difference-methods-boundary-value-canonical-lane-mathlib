import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure SolutionStabilityPackage where
  conditionNumberUpperBound : Float
  epsilonStability : Prop
  perturbationBound : Prop
  normEstimate : Prop

structure SolutionStabilityEvidence (S : SolutionStabilityPackage) where
  epsilonStabilityClosed : S.epsilonStability
  perturbationBoundClosed : S.perturbationBound
  normEstimateClosed : S.normEstimate

def SolutionStabilityClosed (S : SolutionStabilityPackage) : Prop := 
  S.epsilonStability ∧ S.perturbationBound ∧ S.normEstimate

theorem solution_stability_closed_from_evidence (S : SolutionStabilityPackage)
    (E : SolutionStabilityEvidence S) : SolutionStabilityClosed S := by
  exact And.intro E.epsilonStabilityClosed (And.intro E.perturbationBoundClosed E.normEstimateClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse