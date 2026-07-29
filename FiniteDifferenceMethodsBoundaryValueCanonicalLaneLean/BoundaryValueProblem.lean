import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure BoundaryValueProblemPackage where
  domainType : Prop
  differentialOperator : Prop
  boundaryConditions : Prop
  wellPosed : Prop

structure BoundaryValueProblemEvidence (B : BoundaryValueProblemPackage) where
  domainTypeClosed : B.domainType
  differentialOperatorClosed : B.differentialOperator
  boundaryConditionsClosed : B.boundaryConditions
  wellPosedClosed : B.wellPosed

def BoundaryValueProblemClosed (B : BoundaryValueProblemPackage) : Prop :=
  B.domainType ∧ B.differentialOperator ∧ B.boundaryConditions ∧ B.wellPosed

theorem boundary_value_problem_closed_from_evidence
    (B : BoundaryValueProblemPackage) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro E.domainTypeClosed
    (And.intro E.differentialOperatorClosed
      (And.intro E.boundaryConditionsClosed E.wellPosedClosed))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
