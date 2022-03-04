#!/bin/bash --login
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --partition=josephsnodes
#SBATCH --account=josephsnodes
# output information about how this job is running using bash commands
echo "This job is running on $HOSTNAME on `date`"

ml -* GCC/10.2.0 OpenMPI/4.0.5 Biopython/1.79-a

# remove output file if it already exists
rm NandSvalues_arabidopsis_thaliana.txt

# loop over codon aligned fasta files, calculate N and S
for FILE in finalCodonAlignments/*.fasta
do
  python3 neiGojobori_dnds.py $FILE >> NandSvalues_arabidopsis_thaliana.txt
done