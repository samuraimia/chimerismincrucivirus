from Bio import SeqIO

with open("Putative CruV Capsid Protein.gb") as input_handle, open(
    "Putative CruV Capsid Protein.fasta", "w"
) as output_handle:
    sequences = SeqIO.parse(input_handle, "genbank")
    count = SeqIO.write(sequences, output_handle, "fasta")
