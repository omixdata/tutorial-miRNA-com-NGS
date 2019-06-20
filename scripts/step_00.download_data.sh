mkdir -p reads/
mkdir -p reference/

cd reads/

while read sample; do
	fastq-dump $sample
done < ../samples

cd ../reference

rm -r *

wget ftp://ftp.ensembl.org/pub/release-96/fasta/equus_caballus/dna/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz
wget ftp://ftp.ensembl.org/pub/release-96/gff3/equus_caballus/Equus_caballus.EquCab3.0.96.gff3.gz

for file in *.gz; do
	gzip -d $file
done

mv *.fa reference.fa
mv *.gff3 reference.gff3

cat reference.fa | cut -d' ' -f1 > _reference.fa
mv _reference.fa reference.fa