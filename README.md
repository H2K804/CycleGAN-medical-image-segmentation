# CycleGAN

As proposed by [Jun-Yan Zhu](https://people.eecs.berkeley.edu/~junyanz/) in 
[Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks](https://arxiv.org/pdf/1703.10593.pdf). 

## Prerequisites
- tensorflow r1.1
- numpy 1.11.0
- scipy 0.17.0
- pillow 3.3.0


### Train
```bash
python main.py --dataset_dir=med_image
```

### Test
```bash
python main.py --dataset_dir=med-image --phase=test --which_direction=AtoB
```

## References
- CycleGAN implementation, https://github.com/XHUJOY/CycleGAN-tensorflow
- Torch CycleGAN, https://github.com/junyanz/CycleGAN