process PLOT {
    tag "${params.dataname}"
    publishDir "${params.outdir}/plots/dotplots",  
        mode: "copy", 
        pattern: "*.dotplot.png"
    publishDir "${params.outdir}/plots/boxplots",  
        mode: "copy", 
        pattern: "*.boxplot.png"

    label 'process_medium'

    input:
    path plotterFile
    path splizvd_pq
    path domain
    path gtf
    val dataname
    val grouping_level_1
    val grouping_level_2

    output:
    path '*dotplot.png'     , emit: dotplot   
    path '*boxplot.png'     , emit: boxplot                                  
                               
    script:
    """
    plot.py \\
        --plotterFile ${plotterFile} \\
        --svd ${splizvd_pq} \\
        --domain ${domain} \\
        --gtf_file ${gtf} \\
        --dataname ${dataname} \\
        --grouping_level_1 ${grouping_level_1} \\
        --grouping_level_2 ${grouping_level_2}
    """

} 