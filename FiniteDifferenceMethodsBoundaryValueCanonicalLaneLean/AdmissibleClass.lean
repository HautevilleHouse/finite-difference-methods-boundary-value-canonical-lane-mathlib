import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean

structure AdmissibleClass where
  object : FiniteDifferenceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FiniteDifferenceWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FiniteDifferenceMethodsBoundaryValueCanonicalLaneLean
end HautevilleHouse