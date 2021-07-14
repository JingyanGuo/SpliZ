process SVD_ZSCORE {
    tag "${dataname}"

    publishDir "${params.outdir}",  mode: "copy", pattern: "*.tsv"

    input:
    val rijk
    val svd_type

    output:
    path "*.geneMat"    , emit: geneMats
    path "*.pq"         , emit: pq
    path "*.tsv"        , emit: tsv

    script:
    dataname    = rijk[0]
    param_stem  = rijk[1]
    rijk_file   = rijk[2]

    """
    svd_zscore.py \\
        --input ${rijk_file} \\
        --dataname ${dataname} \\
        --param_stem ${param_stem} \\
        --svd_type ${svd_type} \\
    """
} 