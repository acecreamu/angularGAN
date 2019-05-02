a=$(ls datasets/facades/test | wc -l)
echo $a
python test.py --dataroot ./datasets/facades --name angular_gan --model angular_gan --which_direction BtoA --display_id -1 --how_many $a
