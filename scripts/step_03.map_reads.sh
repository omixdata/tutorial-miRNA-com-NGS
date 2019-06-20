while read sample; do
	mkdir -p alignments/$sample
	cd alignments/$sample
	rm $sample.aligned.aff
	perl ../../bin/mirdeep2/bin/mapper.pl ../../reads/$sample.fasta \
		-p ../../reference_indexed/reference \
		-c -i -j -l 18 -m \
		-t $sample.aligned.aff
	cd ../../
done < samples
