import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure EllipticBoundaryValueProblemPackage where
  differentialOperator : Type u
  boundaryOperator : Type v
  weakFormulation : Type w
  regularity : Prop
  wellPosedness : Prop
  discreteApproximation : Prop

structure EllipticBoundaryValueProblemEvidence (E : EllipticBoundaryValueProblemPackage) where
  regularityClosed : E.regularity
  wellPosednessClosed : E.wellPosedness
  discreteApproximationClosed : E.discreteApproximation

def EllipticBoundaryValueProblemClosed (E : EllipticBoundaryValueProblemPackage) : Prop :=
  E.regularity ∧ E.wellPosedness ∧ E.discreteApproximation

theorem elliptic_boundary_value_problem_closed_from_evidence
    (E : EllipticBoundaryValueProblemPackage)
    (Ev : EllipticBoundaryValueProblemEvidence E) :
    EllipticBoundaryValueProblemClosed E := by
  exact And.intro Ev.regularityClosed
    (And.intro Ev.wellPosednessClosed Ev.discreteApproximationClosed)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse