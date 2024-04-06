Return-Path: <linux-doc+bounces-13591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97F89A9CE
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 11:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A612832F6
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 09:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D7120313;
	Sat,  6 Apr 2024 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LL8LDxyC"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E001A29A
	for <linux-doc@vger.kernel.org>; Sat,  6 Apr 2024 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712394349; cv=none; b=ZB8PfgwFgrbJdy/EzjLAlP5fR1lKgS56MmrzApuwfzjEVmbdBROO9hkjvMlr0K2ipcN7WGN/WVRvBV15mIcrlZMNWLAKE5v7GcvYuPlZvvpXV+F80+cMXnakoRF5Tw+83K1h0fXR20uLUpht+VHzyi4x6ZIa+FePr4FqQtdyHRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712394349; c=relaxed/simple;
	bh=QKT6ZgMmLZgvHpHSPv5dWWpjzG6gbWOWYvrh3WXbrcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdD4oI8huvHj5vO7Uigi1vJMnq/DnaEZ065mJM1i8+F3cyRoAS2lccZN6nqy05DpVKWo1yR6dJOeCDwV2RSHD3y0Vfb8M9PYJrawx4Gn1V0VA7GIAaQQcOBeYOPKdjKFm80zyPYiZKIggmMWraVacGkqbFAPuq9UIYLEUh4BRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LL8LDxyC; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <5c47f5de-c3cf-4921-9e8c-efc8b55f1d7f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712394345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8QB0c6fetFanEVdDBif61y8ep5Rhwz7oQ9ZgyX91gs=;
	b=LL8LDxyCHIsG46BUlaYrm6eGjyTeDsk7fwLU4pMX5eZnbXJf6M8TTWkzuQwW1BcJE1vIgZ
	CFngzH65ObigEf/TceBCQTtrJ0gEJcD79/AXBMC+B0duT5sgxHCfowUAg8KTs3EEWKOe86
	x1y1knsfC+eBZjf7u2iVcepo0QvoVDg=
Date: Sat, 6 Apr 2024 11:05:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next v4 0/2] devlink: Add port function attribute for IO EQs
To: Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, corbet@lwn.net, dw@davidwei.uk,
 kalesh-anakkur.purayil@broadcom.com
Cc: saeedm@nvidia.com, leon@kernel.org, jiri@resnulli.us, shayd@nvidia.com,
 danielj@nvidia.com, dchumak@nvidia.com, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org
References: <20240406010538.220167-1-parav@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20240406010538.220167-1-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2024/4/6 3:05, Parav Pandit 写道:
> Currently, PCI SFs and VFs use IO event queues to deliver netdev per
> channel events. The number of netdev channels is a function of IO
> event queues. In the second scenario of an RDMA device, the
> completion vectors are also a function of IO event queues. Currently, an
> administrator on the hypervisor has no means to provision the number
> of IO event queues for the SF device or the VF device. Device/firmware
> determines some arbitrary value for these IO event queues. Due to this,
> the SF netdev channels are unpredictable, and consequently, the
> performance is too.
> 
> This short series introduces a new port function attribute: max_io_eqs.
> The goal is to provide administrators at the hypervisor level with the
> ability to provision the maximum number of IO event queues for a
> function. This gives the control to the administrator to provision
> right number of IO event queues and have predictable performance.
> 
> Examples of when an administrator provisions (set) maximum number of
> IO event queues when using switchdev mode:
> 
>    $ devlink port show pci/0000:06:00.0/1
>        pci/0000:06:00.0/1: type eth netdev enp6s0pf0vf0 flavour pcivf pfnum 0 vfnum 0
>            function:
>            hw_addr 00:00:00:00:00:00 roce enable max_io_eqs 10
> 
>    $ devlink port function set pci/0000:06:00.0/1 max_io_eqs 20
> 
>    $ devlink port show pci/0000:06:00.0/1
>        pci/0000:06:00.0/1: type eth netdev enp6s0pf0vf0 flavour pcivf pfnum 0 vfnum 0
>            function:
>            hw_addr 00:00:00:00:00:00 roce enable max_io_eqs 20
> 
> This sets the corresponding maximum IO event queues of the function
> before it is enumerated. Thus, when the VF/SF driver reads the
> capability from the device, it sees the value provisioned by the
> hypervisor. The driver is then able to configure the number of channels
> for the net device, as well as the number of completion vectors
> for the RDMA device. The device/firmware also honors the provisioned
> value, hence any VF/SF driver attempting to create IO EQs
> beyond provisioned value results in an error.
> 
> With above setting now, the administrator is able to achieve the 2x
> performance on SFs with 20 channels. In second example when SF was
> provisioned for a container with 2 cpus, the administrator provisioned only
> 2 IO event queues, thereby saving device resources.
> 

The following paragraph is the same with the above paragraph?

> With the above settings now in place, the administrator achieved 2x
> performance with the SF device with 20 channels. In the second example,
> when the SF was provisioned for a container with 2 CPUs, the administrator
> provisioned only 2 IO event queues, thereby saving device resources.
> 
> changelog:
> v2->v3:
> - limited to 80 chars per line in devlink
> - fixed comments from Jakub in mlx5 driver to fix missing mutex unlock
>    on error path
> v1->v2:
> - limited comment to 80 chars per line in header file
> - fixed set function variables for reverse christmas tree
> - fixed comments from Kalesh
> - fixed missing kfree in get call
> - returning error code for get cmd failure
> - fixed error msg copy paste error in set on cmd failure
> 
> Parav Pandit (2):
>    devlink: Support setting max_io_eqs
>    mlx5/core: Support max_io_eqs for a function
> 
>   .../networking/devlink/devlink-port.rst       | 33 +++++++
>   .../mellanox/mlx5/core/esw/devlink_port.c     |  4 +
>   .../net/ethernet/mellanox/mlx5/core/eswitch.h |  7 ++
>   .../mellanox/mlx5/core/eswitch_offloads.c     | 97 +++++++++++++++++++
>   include/net/devlink.h                         | 14 +++
>   include/uapi/linux/devlink.h                  |  1 +
>   net/devlink/port.c                            | 53 ++++++++++
>   7 files changed, 209 insertions(+)
> 


