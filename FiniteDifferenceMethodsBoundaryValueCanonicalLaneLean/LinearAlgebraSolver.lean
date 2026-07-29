import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure LinearSolver where
  matrixSize : Nat
  sparsityPattern : String
  relaxationFactor : Float
  convergenceTolerance : Float
  preconditionerUsed : Bool

default estimateConditionNumber : Nat := 0

structure LinearSolverEvidence (S : LinearSolver) where
  matrixNonsingular : S.matrixSize > 0
  sparsityKnown : S.sparsityPattern ∈ {"tridiagonal", "pentadiagonal", "blockTridiagonal"}
  relaxationValid : S.relaxationFactor > 0.0 ∧ S.relaxationFactor < 2.0
  tolerancePositive : S.convergenceTolerance > 0.0
  preconditioningConsistent : S.preconditionerUsed → (S.sparsityPattern = "blockTridiagonal")

def LinearSolverClosed (S : LinearSolver) : Prop :=
  S.matrixSize > 0 ∧
  (S.sparsityPattern ∈ {"tridiagonal", "pentadiagonal", "blockTridiagonal"}) ∧
  (S.relaxationFactor > 0.0 ∧ S.relaxationFactor < 2.0) ∧
  S.convergenceTolerance > 0.0 ∧
  (S.preconditionerUsed → (S.sparsityPattern = "blockTridiagonal"))

theorem linear_solver_closed_from_evidence
    (S : LinearSolver) (E : LinearSolverEvidence S) : LinearSolverClosed S := by
  refine And.intro E.matrixNonsingular
    (And.intro E.sparsityKnown
      (And.intro E.relaxationValid
        (And.intro E.tolerancePositive E.preconditioningConsistent)))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse