import torch
from math import pi

class angular_loss(torch.nn.Module):
    
    def __init__(self):
        super(angular_loss,self).__init__()
        
    def forward(self, illum_gt, illum_pred):
        # img_gt = img_input / illum_gt
        # illum_gt = img_input / img_gt
        # illum_pred = img_input / img_output
	
        # ACOS
        cos_between = torch.nn.CosineSimilarity(dim=1)
        cos = cos_between(illum_gt, illum_pred)
        cos = torch.clamp(cos,-0.99999, 0.99999)
        loss = torch.mean(torch.acos(cos)) * 180 / pi

	# MSE
        # loss = torch.mean((illum_gt - illum_pred)**2)
	
        # 1 - COS
        # loss = 1 - torch.mean(cos)
	
        # 1 - COS^2
        # loss = 1 - torch.mean(cos**2)
        return loss
