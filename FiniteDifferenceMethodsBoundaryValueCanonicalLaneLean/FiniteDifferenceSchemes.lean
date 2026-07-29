import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure FiniteDifferenceSchemePackage where
  gridType : Prop
  stencilWeights : Prop
  consistencyOrder : Prop
  stabilityCondition : Prop

structure FiniteDifferenceSchemeEvidence (F : FiniteDifferenceSchemePackage) where
  gridTypeClosed : F.gridType
  stencilWeightsClosed : F.stencilWeights
  consistencyOrderClosed : F.consistencyOrder
  stabilityConditionClosed : F.stabilityCondition

def FiniteDifferenceSchemeClosed (F : FiniteDifferenceSchemePackage) : Prop :=
  F.gridType ∧ F.stencilWeights ∧ F.consistencyOrder ∧ F.stabilityCondition

theorem finite_difference_scheme_closed_from_evidence
    (F : FiniteDifferenceSchemePackage) (E : FiniteDifferenceSchemeEvidence F) :
    FiniteDifferenceSchemeClosed F := by
  exact And.intro E.gridTypeClosed
    (And.intro E.stencilWeightsClosed
      (And.intro E.consistencyOrderClosed E.stabilityConditionClosed))

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
