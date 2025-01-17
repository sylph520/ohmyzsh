alias find_empty='find . -type d -exec sh -c '\''find "{}" -maxdepth 1 -name "result.json" -type f -empty | grep -q .'\'' \; -print'
alias move_empty='find . -type d -exec sh -c '\''find "{}" -maxdepth 1 -name "result.json" -type f -empty | grep -q .'\'' \; -exec mv "{}" ../tmp2rm \;'
alias check_empty='tree -L 2 -h ../tmp2rm'
alias delete_empty='find . -type d -exec sh -c '\''find "{}" -maxdepth 1 -name "result.json" -type f -empty | grep -q .'\'' \; -exec rm -r "{}" \;'

iset(){
	local iter
	if [[ $3 -lt 10 ]]; then
		iter="00$3"
	elif [[ $3 -lt 100 && $3 -ge 10 ]]; then
		iter="0$3"
	else
		iter="$3"
	fi
	python -m selection $1 --train False --raylog False --restore_path ~/project/ise2_ray_results_test/PPO/$2/checkpoint_000$iter/checkpoint-$3 DISABLE_OUTPUT_FILES 1 $@
}

isetswirl(){
	local param_iter
	local iter
	param_iter=$2
	# echo $param_iter
	if [[ $2 -lt 10 ]]; then
		iter="00$2"
	elif [[ $2 -lt 100 && $2 -ge 10 ]]; then
		iter="0$2"
	else
		iter="$2"
	fi
	python -m selection conf/config_rl_custom1_idxub3_wl_embedder.json --train False --raylog False --restore_path ~/project/ise2_ray_results_test/PPO/$1/checkpoint_000$iter/checkpoint-$2 $@
}

isetbase(){
	local param_iter
	local iter
	param_iter=$2
	# echo $param_iter
	if [[ $2 -lt 10 ]]; then
		iter="00$2"
	elif [[ $2 -lt 100 && $2 -ge 10 ]]; then
		iter="0$2"
	else
		iter="$2"
	fi
	python -m selection conf/config_rl_custom1_idxub3.json --train False --raylog False --restore_path ~/project/ise2_ray_results_test/PPO/$1/checkpoint_000$iter/checkpoint-$2 $@
}


vip()
{
  nvim ${1}/params.json
}

dip()
{
  nvim -d $1/params.json $2/params.json
}

dic()
{
  nvim -d $1/conf.json $2/conf.json
}
