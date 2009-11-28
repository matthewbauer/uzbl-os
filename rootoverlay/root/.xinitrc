exec ratpoison &

pid=$!

xsetroot -cursor_name left_ptr &

uzbl-core eyeos.info &

wait $pid
