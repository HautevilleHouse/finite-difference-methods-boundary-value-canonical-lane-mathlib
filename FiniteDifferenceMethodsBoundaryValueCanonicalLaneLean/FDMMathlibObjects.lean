import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure FDMSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FDMAdmittedObject where
  space : FDMSpace
  boundedDomain : Prop
  differentialOperatorDefined : Prop
  boundaryDataGiven : Prop
  conclusion : finiteDifferenceSolutionExists
  finiteDifferenceSolutionExists : Prop

def FDMWitnessClosed (O : FDMAdmittedObject) : Prop :=
  O.finiteDifferenceSolutionExists

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse
