xsetroot -cursor_name left_ptr

exec ratpoison &
pid=$!

uzbl-browser file:///srv/http/load &

wait $pid
