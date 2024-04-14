Return-Path: <linux-doc+bounces-13600-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAA89B2C8
	for <lists+linux-doc@lfdr.de>; Sun,  7 Apr 2024 18:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127991F20F2E
	for <lists+linux-doc@lfdr.de>; Sun,  7 Apr 2024 16:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E15339FEF;
	Sun,  7 Apr 2024 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="eDIOg91r"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF671EEE9
	for <linux-doc@vger.kernel.org>; Sun,  7 Apr 2024 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712506093; cv=none; b=tIrDVW622arEsMJQgqdn/Dpm5vYaArwIFAhuaLUwfGCuP8KsjNpsvhsSVbbhfXzzAFQFseTamXaEFtWOyNRQc1FcWj4b3vseDgnNNFGzMUIPu8UePZ1wG9Ux+8PSJoAGeZ9sGo/ddP4sOKEqhM9F2wMf2PXoRXKGe2VzVYcyM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712506093; c=relaxed/simple;
	bh=zGkuvzr8pf1LER3G8FWKDDHaUt07rPeEIJjxGNiB4hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rml7VfADVcv1yKGvKBvpZef5YgAdpInXLLAUfHcpI81R1axF/cwP9OmqqxyryVo7/wNgoZaqgDnUXewf6KAehPwb/bPMdK00JkBsRyCbPvEmoibv23QaXwMeyjRoQfPONOHksx6I8ZaNbTyCnpJnKgFNijy+tV1pJvX6CA4zTTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=eDIOg91r; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29c14800a7fso2563947a91.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Apr 2024 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1712506092; x=1713110892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSGIn0xXQNmOG1sNf+o8Pi6w9FLOfAhgffN85yMP1ec=;
        b=eDIOg91rTGFAugZ3tTcVs0lH58CLz4knUCx7VCXPZ8wWbBIVwM5IEYHCky4CYUCNbZ
         OyqZqpFEYkotiPzUN9wESpOfX8mAvodexzs2oJFAW1dSa2ojAQdd6/2MCtk2axYnTLf8
         5Kt8o2cAEAcve4m527YUtawJ8fnbaE86tSKAg/NygAK0iEV6acenCdjsSPtYV3m+RJ0n
         txC7j/9u8ELCdwOsOAkGEGNY4+2pD+f973KMlkBYa/Eo1yjPrXDv6u9dzcyihs8LedPd
         693kcMdWqpBSS28j5FXcl05GSzkxCUmPDF4a9Dquohpt7TNida+3nzjhALBjAyalo27Y
         tK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712506092; x=1713110892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSGIn0xXQNmOG1sNf+o8Pi6w9FLOfAhgffN85yMP1ec=;
        b=EcpDwV4VTMb4n16m2a9sr70LbFd47KyHSRvfC2MPhiLRTq7z5G4Tp6g9KWsNkiGUeO
         a+nYhkg33Z2o4IHfYYqny+I2qTTTZl6oat8ab3eD6Ju6XiamdJEAlVu/YbnFhTTgk1/T
         s+ZoEhVMmHbpEsWuZ+9HFWPdlfzUJjWsATAJcmynhpHFL02h6b+OsQTGRR8b8gaO1/zT
         iLRpGAUnFrWy5FzuDv42TRDJemldKeTHRLUFjOMR2Wzec8ClR8vvS5e0tYuwmSe+u3Sd
         9ZxolQC7EnDTvbVdw3cMbG4atpZMm7wYeax7Zkd4F2m7VFjR5lJqxMqs+ze1OjnH+W9b
         egug==
X-Forwarded-Encrypted: i=1; AJvYcCXXwic3TXljdwOuETzgkbLTOxy+17r8UVjWUTSJsq/ygdQW4iMMwz0mmfq5A8VHOdkSj2gP082txtPd8pDpRiaW6I6pmmVdO3VZ
X-Gm-Message-State: AOJu0YyhQ88RUXYM7Y7LqQJvwtR3Tbka9cSwDO5FBo9ReHKPVmgUc1Ia
	IuugCizM9cgGPY2HGvnaoYzwUf4ZNKnzK1kQrZieUSXbFvnCPfnUnXsp/c41nts=
X-Google-Smtp-Source: AGHT+IEaLJJ9iUSeaEdc0RSiBHPeejYzWdhLArNsd5EXcOe9i8rfZPxEgmS7Sf5xyCXKdIXpdSJ7+A==
X-Received: by 2002:a17:90a:d242:b0:2a4:9222:a915 with SMTP id o2-20020a17090ad24200b002a49222a915mr4085444pjw.0.1712506091745;
        Sun, 07 Apr 2024 09:08:11 -0700 (PDT)
Received: from [192.168.1.27] (71-212-18-124.tukw.qwest.net. [71.212.18.124])
        by smtp.gmail.com with ESMTPSA id cu12-20020a17090afa8c00b002a2f6da006csm4735204pjb.52.2024.04.07.09.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 09:08:11 -0700 (PDT)
Message-ID: <f58a134c-f46f-4b30-b520-12b05e1346d2@davidwei.uk>
Date: Sun, 7 Apr 2024 09:08:10 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v4 2/2] mlx5/core: Support max_io_eqs for a function
To: Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, corbet@lwn.net, kalesh-anakkur.purayil@broadcom.com
Cc: saeedm@nvidia.com, leon@kernel.org, jiri@resnulli.us, shayd@nvidia.com,
 danielj@nvidia.com, dchumak@nvidia.com, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org
References: <20240406010538.220167-1-parav@nvidia.com>
 <20240406010538.220167-3-parav@nvidia.com>
Content-Language: en-GB
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240406010538.220167-3-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-05 6:05 pm, Parav Pandit wrote:
> Implement get and set for the maximum IO event queues for SF and VF.
> This enables administrator on the hypervisor to control the maximum
> IO event queues which are typically used to derive the maximum and
> default number of net device channels or rdma device completion vectors.
> 
> Reviewed-by: Shay Drory <shayd@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v3->v4:
> - addressed comment from David
> - replaced open coded overflow check with kernel api
> v2->v3:
> - limited to 80 chars per line in devlink
> - fixed comments from Jakub in mlx5 driver to fix missing mutex unlock
>   on error path
> v1->v2:
> - fixed comments from Kalesh
> - fixed missing kfree in get call
> - returning error code for get cmd failure
> - fixed error msg copy paste error in set on cmd failure
> - limited code to 80 chars limit
> - fixed set function variables for reverse christmas tree
> 
> ---
>  .../mellanox/mlx5/core/esw/devlink_port.c     |  4 +
>  .../net/ethernet/mellanox/mlx5/core/eswitch.h |  7 ++
>  .../mellanox/mlx5/core/eswitch_offloads.c     | 97 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
> 

LGTM, thanks for addressing.

