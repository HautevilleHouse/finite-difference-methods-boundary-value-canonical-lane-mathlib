import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure DiscretizationMatrixPackage where
  gridSize : Nat
  stepSize : Float
  matrixType : Type u
  symmetric : Prop
  positiveDefinite : Prop
  sparseRepresentation : Type v

structure DiscretizationMatrixEvidence (D : DiscretizationMatrixPackage) where
  symmetricClosed : D.symmetric
  positiveDefiniteClosed : D.positiveDefinite

def DiscretizationMatrixClosed (D : DiscretizationMatrixPackage) : Prop := 
  D.symmetric ∧ D.positiveDefinite

theorem discretization_matrix_closed_from_evidence (D : DiscretizationMatrixPackage)
    (E : DiscretizationMatrixEvidence D) : DiscretizationMatrixClosed D := by
  exact And.intro E.symmetricClosed E.positiveDefiniteClosed

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse