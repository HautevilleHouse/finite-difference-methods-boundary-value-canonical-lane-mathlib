import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure DiscreteMaximumPrinciplePackage where
  discreteOperatorCooper : Prop
  meshType : String
  boundaryCondition : String
  stencilType : String
  monotonicityAssured : Prop

structure DiscreteMaximumPrincipleEvidence (D : DiscreteMaximumPrinciplePackage) where
  discreteOperatorCooperClosed : D.discreteOperatorCooper
  monotonicityAssuredClosed : D.monotonicityAssured

def DiscreteMaximumPrincipleClosed (D : DiscreteMaximumPrinciplePackage) : Prop :=
  D.discreteOperatorCooper ∧ D.monotonicityAssured

theorem discrete_maximum_principle_closed_from_evidence (D : DiscreteMaximumPrinciplePackage)
    (E : DiscreteMaximumPrincipleEvidence D) : DiscreteMaximumPrincipleClosed D := by
  exact And.intro E.discreteOperatorCooperClosed E.monotonicityAssuredClosed

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
