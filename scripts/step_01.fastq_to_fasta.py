from Bio import SeqIO

def clear_sequence(_sequence):
    sequence = ''
    _sequence = _sequence.upper()
    for base in _sequence:
        if base in 'ATCGN':
            sequence += base
        else:
            sequence += 'N'
    return sequence

for s, sample in enumerate(open('samples')):
    sample = sample.strip('\n')
    records = SeqIO.parse(
        open("reads/%s.fastq"%sample),
        'fastq')
    
    sequence_uniq = set([])
    sequence_count = {}

    for record in records:
        sequence = str(record.seq)
        sequence_uniq.add(str(record.seq))
        if sequence not in sequence_count:
            sequence_count[sequence] = 0
        sequence_count[sequence] += 1
    
    with open('reads/%s.fasta'%sample, 'w') as writer:
        for seq, sequence in enumerate(sequence_uniq):
            if len(sequence) < 20:
                continue
            sequence = clear_sequence(sequence)
            writer.write(">%s_%s_x%s\n%s\n"%(
                str(s+1).zfill(3),
                seq+1, 
                sequence_count[sequence],
                sequence))
