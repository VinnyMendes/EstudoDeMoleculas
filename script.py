# sdv em https://www.thermofisher.com/br/en/home/global/forms/lab-solutions/maybridge-library/thank-you.html?form-submit-token=c774473e6e2a99d5d9491ce37986acd&form-submit-id=LCD_PR_FM_0720_MaybridgeLibrary_GLB

from rdkit import Chem
from rdkit.Chem import Descriptors, Crippen, Lipinski, MolSurf, rdMolDescriptors, MACCSkeys
# from rdkit.Chem.Descriptors import ExactMolWt
# from rdkit.Chem.Crippen import MolLogP
# from rdkit.Chem.Lipinski import RingCount

suppl = Chem.SDMolSupplier('./Maybridge_Screening_collection.sdf')
n_mols = len(suppl)

i = suppl[0]
#print(i.GetNumAtoms())
teste = i.GetPropNames()
# print(i.GetProp("Mwt"))
for j in teste:
    print(j)

# for j in suppl:
#     print(ExactMolWt(j))

print(i.GetProp("MWt")) #ja esta no bd
print(Descriptors.ExactMolWt(i)) #calcula o valor exato
