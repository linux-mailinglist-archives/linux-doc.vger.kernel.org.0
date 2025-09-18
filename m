Return-Path: <linux-doc+bounces-59130-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8EB47C8B
	for <lists+linux-doc@lfdr.de>; Sun,  7 Sep 2025 19:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1CB3BAC40
	for <lists+linux-doc@lfdr.de>; Sun,  7 Sep 2025 17:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C868284899;
	Sun,  7 Sep 2025 17:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pc5F4vkf"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E3280A5F
	for <linux-doc@vger.kernel.org>; Sun,  7 Sep 2025 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757264548; cv=none; b=K2Sv+jjS3TCtXkFsjM1ZENPxQW0ZKTPPZ5JgrGX9uLOmo1h9y+wIN+3sJ8v9nAacDHuaBe5QUr0xOvz1exZfYEVvUx8j1OKkyISqqZPEvxjpdlOfjOrTd7E7qbqyNy3sCx20kfFuGFPPZBWmiK2Yx+hZ2EJERtBRD1jTbGcG8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757264548; c=relaxed/simple;
	bh=pZD4tEIZUEKClZFShsoJNa/2iBOVNA9IPvLNH9RRFF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/UskDqBAawR4tGvpkp3uCcpJcY1GZJnpU8em4dv0O3NtFI0bCaK6avt4/2FUHx5A5lfhYpNVSZrupfkVMRJTBGTIfnzx1UVtmSd3h3DrlZFvmrPVvpoUo3cHfFfPwUPI+8ZeMg7bWdxBOiHRFtvn0c33iFMq3yRmmhqKr0Kr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pc5F4vkf; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <98c93693-0647-4c7e-ac1c-729502beab76@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757264534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BpoMe7d7Kugc9Y1D7mPUdyY4RnJVBGdaC/+fYtsNMQ=;
	b=Pc5F4vkfsytINfbG8VdYiuuX2FOWy8zm5XNcsP53lO+I+fCOOMtJznKQkytd5iuDzJBH5Y
	Uu5SIdP8Qp1yor43oYoRkPBZE461WtY6V4HDLYBKedKYuwBvW4kQ+jkdHF8DW2bx8RBRjj
	WubaymY0/1EV3nSTx7Nmutck9Qw2Z1g=
Date: Sun, 7 Sep 2025 18:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v04 06/14] hinic3: Nic_io initialization
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <helgaas@kernel.org>, luosifu <luosifu@huawei.com>,
 Xin Guo <guoxin09@huawei.com>, Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>,
 Lee Trager <lee@trager.us>, Michael Ellerman <mpe@ellerman.id.au>,
 Suman Ghosh <sumang@marvell.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1757057860.git.zhuyikai1@h-partners.com>
 <0d48674ae76a54bf52dcdba64fb60eb26e7e7e70.1757057860.git.zhuyikai1@h-partners.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <0d48674ae76a54bf52dcdba64fb60eb26e7e7e70.1757057860.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 05/09/2025 09:28, Fan Gong wrote:
> Add nic_io initialization to enable NIC service, initialize function table
> and negotiate activation of NIC features.

[...]

> +static DEFINE_IDA(hinic3_adev_ida);
> +
> +static int hinic3_adev_idx_alloc(void)
> +{
> +	return ida_alloc(&hinic3_adev_ida, GFP_KERNEL);
> +}
> +
> +static void hinic3_adev_idx_free(int id)
> +{
> +	ida_free(&hinic3_adev_ida, id);
> +}
> +
>   int hinic3_init_hwdev(struct pci_dev *pdev)
>   {
>   	struct hinic3_pcidev *pci_adapter = pci_get_drvdata(pdev);
> @@ -451,6 +463,7 @@ int hinic3_init_hwdev(struct pci_dev *pdev)
>   	hwdev->pdev = pci_adapter->pdev;
>   	hwdev->dev = &pci_adapter->pdev->dev;
>   	hwdev->func_state = 0;
> +	hwdev->dev_id = hinic3_adev_idx_alloc();

Why do you need dev_id? It's not used anywhere in the patchset. The
commit doesn't explain it neither...


