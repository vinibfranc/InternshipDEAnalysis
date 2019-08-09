installation:
	bash scripts/00_installation.sh
download_samples:
	bash scripts/01_download_samples.sh
quality_control:
	bash scripts/02_quality_control.sh
alignment:
	bash scripts/03_alignment.sh
count_features:
	bash scripts/04_count_features.sh
functional_annotation:
	bash scripts/05_functional_annotation.sh
find_orthologs:
	bash scripts/06_find_orthologs.sh
