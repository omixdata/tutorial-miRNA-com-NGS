while read sample; do
	mkdir -p alignments/$sample
	cd alignments/$sample
	perl ../../bin/mirdeep2/bin/miRDeep2.pl \
        ../../reads/$sample.fasta \
        ../../reference/reference.fa \
		$sample.aligned.aff \
        ../../mirbase/mirbase_eca.fasta \
		../../mirbase/mirbase_hsa.fasta \
		none
	cd ../../
done < samples
