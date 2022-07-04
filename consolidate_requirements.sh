cat hm-config/requirements.txt > consolidate_requirements.txt
cat hm-diag/requirements.txt >> consolidate_requirements.txt
cat hm-pktfwd/requirements.txt >> consolidate_requirements.txt
cat hm-pyhelper/requirements.txt >> consolidate_requirements.txt
cat consolidate_requirements.txt | sort | uniq > consolidate_requirements.txt.1
mv consolidate_requirements.txt.1 consolidate_requirements.txt
