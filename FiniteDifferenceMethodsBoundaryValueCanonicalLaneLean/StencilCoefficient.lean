import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure StencilCoefficientPackage where
  interiorNodes : Nat
  boundaryNodes : Nat
  stencilMatrix : Type u
  consistencyOrder : Nat
  stabilityCondition : Prop
  coefficientTable : Type v

structure StencilCoefficientEvidence (S : StencilCoefficientPackage) where
  interiorNodesClosed : S.interiorNodes = 100
  boundaryNodesClosed : S.boundaryNodes = 20
  consistencyOrderClosed : S.consistencyOrder = 2
  stabilityConditionClosed : S.stabilityCondition

def StencilCoefficientClosed (S : StencilCoefficientPackage) : Prop :=
  S.stabilityCondition

theorem stencil_coefficient_closed_from_evidence (S : StencilCoefficientPackage)
    (E : StencilCoefficientEvidence S) : StencilCoefficientClosed S := by
  exact E.stabilityConditionClosed

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse