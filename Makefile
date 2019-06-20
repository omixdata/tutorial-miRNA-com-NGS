dirs:
	mkdir -p bin/

install: dirs
	apt-get install sra-toolkit python3-pip
	pip3 install biopython
	git clone -o bin/mirdeep2 https://github.com/rajewsky-lab/mirdeep2 \
		bin/mirdeep2 || echo 'mirdeep2 já está clonado'
	bash scripts/install_mirdeep.sh

download_data:
	bash scripts/step_00.download_data.sh

convert_fastq_to_fasta:
	python3 scripts/step_01.fastq_to_fasta.py

index_reference:
	bash scripts/step_02.index_reference.sh

map_reads:
	bash scripts/step_03.map_reads.sh

annotate_mirnas:
	bash scripts/step_04.annotate_mirnas.sh
