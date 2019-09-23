# InternshipDEAnalysis

Ferramentas usadas durante meu estágio que auxiliaram na geração dos arquivos para importar na plataforma [OrthoDEGFinder](https://github.com/vinibfranc/OrthoDEGFinder).

## 1. Instalação

### Programas usados

* sra-toolkit
* FASTQC
* Trim Galore!
* STAR
* HTSeq
* Cufflinks
* Orthofinder


### Dependências dos programas

* python3
* python3-pip
* cutadapt
* curl
* wget
* g++
* make
* MCL
* DIAMOND
* FastME

A instalação dos programas e de suas dependências, bem como a adição das ferramentas ao PATH, pode ser feito utilizando o seguinte comando na raiz do projeto:

```
make installation
```

Essa é uyma regra estabelecida no ```Makefile``` associada ao script presente em ```scripts/00_installation.sh```.

## 2. Download das amostras no Sequence Read Archive

O download das amostras de RNA-seq usando [sra-toolkit](https://github.com/ncbi/sra-tools) pode ser feito utilizando os seguintes comandos:

```
make download_samples organism="ma_e6"
```

ou 

```
make download_samples organism="mr_arsef"
```

Essa regra foi definida para os organismos em análise no estágio, mas o arquivo ```01_download_samples.sh``` presente em ```scripts``` pode ser alterado da mesma forma para o download de outras amostras.

## 3. Controle de qualidade

O controle de qualidade utilizando os programas [Trim Galore!](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/), [FASTQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) e [multiqc](https://multiqc.info/) pode ser executado com os seguintes comandos

```
make quality_control organism="ma_e6"
```

ou 

```
make quality_control organism="mr_arsef"
```

Essa regra foi definida para os organismos em análise no estágio, mas o arquivo ```02_quality_control.sh``` presente em ```scripts``` pode ser alterado da mesma forma para o controle de qualidade de outras amostras.

## 4. Alinhamento ao genoma e anotação de referência

O alinhamento ao genoma e anotação de referência foi realizado o programa [STAR](https://github.com/alexdobin/STAR). O genoma e a anotação de Metarhizium anisopliae ARSEF 549 (usado com referência para Metarhizium anisopliae E6) e Metarhizium robertsii ARSEF 23 foram obtidos no NCBI Genome. A conversão dos arquivos GFF do NCBI para GTF foi feita dentro do próprio script usando o programa gffread do Cufflinks.

Para executar o alinhamento execute os seguintes comandos:

```
make alignment organism="ma_e6"
```

ou 

```
make alignment organism="mr_arsef"
```

Essa regra foi definida para os organismos em análise no estágio, mas o arquivo ```03_alignment.sh``` presente em ```scripts``` pode ser alterado da mesma forma para o alinhamento de outras amostras.

## 5. Contagem de transcritos

A contagem das features (transcritos) alinhadas foi feita usando o programa [HTSeq](https://htseq.readthedocs.io/en/release_0.11.1/).

Para executar a contagem execute o seguinte comando:

```
make count_features organism="ma_e6"
```

ou 

```
make count_features organism="mr_arsef"
```

Essa regra foi definida para os organismos em análise no estágio, mas o arquivo ```04_count_features.sh``` presente em ```scripts``` pode ser alterado da mesma forma para a contagem de transcritos em outras amostras.

## 6. Expressão diferencial em R

A expressão diferencial é realizada usando o pacote em R chamado [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html). Então, a instalação do R e RStudio são pré-requisitos.

As análises podem ser realizadas usando o script ```ma_de_analysis.R``` presente em ```edgeR```, o qual gera a tabela de expressão diferencial que deve ser modificada para a inserção na plataforma [OrthoDEGFinder](https://github.com/vinibfranc/OrthoDEGFinder).

## 7. Anotação funcional

A anotação funcional dos organismos foi gerads no web server do [Pannzer2](http://ekhidna2.biocenter.helsinki.fi/sanspanz/) após a submissão das sequências de proteínas dos organismso e do recebimento dos resultados por e-mail.

Esses arquivos podem ser baixados por linha de comando, como feito no arquivo ```05_functional_annoation.sh``` presente em ```scripts```, ou então baixados manualmente. O arquivo importante desta análise é o ```GO.out```, o qual precisa ser formatado como arquivo TSV e, depois, preparado usando os seguintes comandos:

```
cd all_files_to_upload
awk -F'\t' -vOFS='\t' '{ $4 = "GO:" $4 }1' anisopliae_arsef_549.tsv > anisopliae_arsef_549_formatted.tsv
awk -F'\t' -vOFS='\t' '{ $4 = "GO:" $4 }1' robertsii_arsef_23.tsv > robertsii_arsef_23_formatted.tsv
```

Isso permite a sua correta inserção na plataforma [OrthoDEGFinder](https://github.com/vinibfranc/OrthoDEGFinder).

## 8. Ortólogos

A atribuição de ortologia foi feita usando o [OrthoFinder](https://github.com/davidemms/OrthoFinder). O FASTA com as proteínas de Metarhizium anisopliae ARSEF 549 (usado com referência para Metarhizium anisopliae E6) e Metarhizium robertsii ARSEF 23 foram obtidos no NCBI Genome. 

Para atribuir a ortologia utilize o seguinte comando:

```
make find_orthologs
```

Dentro do script serão extraídos apenas os ortólogos single copy para correta inserção na plataforma [OrthoDEGFinder](https://github.com/vinibfranc/OrthoDEGFinder), que também depende da inserção do ID taxonômico dos organismos ortólogos.

---------------------

Desenvolvido por Vinícius Franceschi em [UBTEC](https://www.facebook.com/ubtec.ufrgs/) - [CBiot](http://www.cbiot.ufrgs.br/) - UFRGS.

Dúvidas, problemas ou sugestões de melhorias podem ser enviadas para: vinibfranc@gmail.com