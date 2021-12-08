#Zet slaap mode uit in archlinux xfce
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
xfconf-query -c xfce4-session -np '/shutdown/ShowHibernate' -t 'bool' -s 'false' 
xfconf-query -c xfce4-session -np '/shutdown/ShowSuspend' -t 'bool' -s 'false'
