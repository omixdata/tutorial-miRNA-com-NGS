mkdir -p reference_indexed
cd reference
bowtie-build --large-index  \
    --bmax 16777216 \
    --dcv 256 \
    --threads 4 \
    reference.fa \
    ../reference_indexed/reference