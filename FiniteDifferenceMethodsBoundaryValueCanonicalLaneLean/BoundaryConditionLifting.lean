import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure BoundaryConditionLiftingPackage where
  dirichletSupported : Prop
  neumannSupported : Prop
  robinSupported : Prop
  liftingOperator : Type u
  liftingProperties : Prop

structure BoundaryConditionLiftingEvidence (B : BoundaryConditionLiftingPackage) where
  dirichletSupportedClosed : B.dirichletSupported
  neumannSupportedClosed : B.neumannSupported
  robinSupportedClosed : B.robinSupported
  liftingPropertiesClosed : B.liftingProperties

def BoundaryConditionLiftingClosed (B : BoundaryConditionLiftingPackage) : Prop := 
  B.dirichletSupported ∧ B.neumannSupported ∧ B.robinSupported ∧ B.liftingProperties

theorem boundary_condition_lifting_closed_from_evidence (B : BoundaryConditionLiftingPackage)
    (E : BoundaryConditionLiftingEvidence B) : BoundaryConditionLiftingClosed B := by
  exact And.intro E.dirichletSupportedClosed
    (And.intro E.neumannSupportedClosed
      (And.intro E.robinSupportedClosed E.liftingPropertiesClosed))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse