import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean.DiscretizationPackage

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure BoundaryValueProblemPackage (D : DiscretizationPackage) where
  domain : Type u
  differentialOperator : D.grid → Prop
  boundaryConditions : D.grid → Prop
  wellPosedness : Prop
  discreteWellPosedness : Prop
  solutionExistence : Prop
  uniqueness : Prop

structure BoundaryValueProblemEvidence {D : DiscretizationPackage} (B : BoundaryValueProblemPackage D) where
  wellPosednessClosed : B.wellPosedness
  discreteWellPosednessClosed : B.discreteWellPosedness
  solutionExistenceClosed : B.solutionExistence
  uniquenessClosed : B.uniqueness

def BoundaryValueProblemClosed {D : DiscretizationPackage} (B : BoundaryValueProblemPackage D) : Prop :=
  B.wellPosedness ∧ B.discreteWellPosedness ∧ B.solutionExistence ∧ B.uniqueness

theorem boundary_value_problem_closed_from_evidence {D : DiscretizationPackage} (B : BoundaryValueProblemPackage D) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro E.wellPosednessClosed (And.intro E.discreteWellPosednessClosed (And.intro E.solutionExistenceClosed E.uniquenessClosed))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse