import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure FiniteDifferenceSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FiniteDifferenceAdmittedObject where
  space : FiniteDifferenceSpace
  boundedDomain : Prop
  linearOperatorDefined : Prop
  boundaryConditionsApplied : Prop
  discreteSolutionExists : Prop
  conclusion : discreteSolutionExists

def FiniteDifferenceWitnessClosed (O : FiniteDifferenceAdmittedObject) : Prop :=
  O.discreteSolutionExists

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse