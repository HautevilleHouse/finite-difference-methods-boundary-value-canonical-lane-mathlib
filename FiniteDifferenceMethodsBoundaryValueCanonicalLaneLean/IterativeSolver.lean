import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure IterativeSolverPackage where
  linearSystem : Type u
  preconditioner : Type v
  iterationMatrix : Type w
  convergenceCriterion : Prop
  rateOfConvergence : Float
  computationalCost : Prop

structure IterativeSolverEvidence (I : IterativeSolverPackage) where
  convergenceCriterionClosed : I.convergenceCriterion
  computationalCostClosed : I.computationalCost

def IterativeSolverClosed (I : IterativeSolverPackage) : Prop :=
  I.convergenceCriterion ∧ I.computationalCost

theorem iterative_solver_closed_from_evidence
    (I : IterativeSolverPackage) (E : IterativeSolverEvidence I) :
    IterativeSolverClosed I := by
  exact And.intro E.convergenceCriterionClosed E.computationalCostClosed

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse