Return-Path: <linux-doc+bounces-55732-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6822B22D0A
	for <lists+linux-doc@lfdr.de>; Tue, 12 Aug 2025 18:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C381888970
	for <lists+linux-doc@lfdr.de>; Tue, 12 Aug 2025 16:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBDD2C15BF;
	Tue, 12 Aug 2025 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XLKYOcbx"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8123D7C7
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015261; cv=none; b=jYNprPOgfcfe8iFJyHmF6X4hstjRJRLysm2SLd3FBx99mHyuWaDA4jRplASJ1HJJwJeRjEu8vxpJOqlu97Jbt6LkuTTdR0EUvc8OULhq9iWSTtKr01lyQGRqPvaGFFNrUydry4CV4OcmwhPUKCqBKPfjanDSjZvtpPeDCNWgPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015261; c=relaxed/simple;
	bh=ismKWayDfSogjaYO92Yaeka9ukqOgNqxUKsplT6Hv3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KA0XRlnMZQOuLpCdTaKZ6bnIk6SbyAKcCdxUAHfcJNFwvTEjTPt1SoqBMoV7clXlsFb6cUYY4zAZ9zpCckp28yawQMQpp6BGwG/5weg1zGhC8K/cU3gfogdKvlhQBPSUsO0OvrdWblge9kn1ZSRE8H4nEKlNeKLqyvTCqcc8TRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XLKYOcbx; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <eafb8874-a7a3-4028-a4ad-d71fc5689813@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755015257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzA/juqqI9D2ox7WUJIvEeXCNLh0gGx2pRgvWC1jUqg=;
	b=XLKYOcbxCPr5pePe9/NabtcKWVRbMA+lgioOj0Z9N/215XaYNbqkfCi6FcZ5dkEnG3kU9+
	69Ybjlvnj3AFhK1ffMlTZ6TOaExgdahUXBGjeG1YsLvy4eNu55D6AKIzeYsyu2rUULc4sG
	HySK5PggUUsbHta9zIj0DNQSGgWj+L4=
Date: Tue, 12 Aug 2025 17:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/5] net: rnpgbe: Add basic mbx_fw support
To: Dong Yibo <dong100@mucse.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, gur.stavi@huawei.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, danishanwar@ti.com, lee@trager.us,
 gongfan1@huawei.com, lorenzo@kernel.org, geert+renesas@glider.be,
 Parthiban.Veerasooran@microchip.com, lukas.bulwahn@redhat.com,
 alexanderduyck@fb.com, richardcochran@gmail.com
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812093937.882045-1-dong100@mucse.com>
 <20250812093937.882045-5-dong100@mucse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250812093937.882045-5-dong100@mucse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/08/2025 10:39, Dong Yibo wrote:
> Initialize basic mbx_fw ops, such as get_capability, reset phy
> and so on.
> 
> Signed-off-by: Dong Yibo <dong100@mucse.com>
> +static int mucse_fw_send_cmd_wait(struct mucse_hw *hw,
> +				  struct mbx_fw_cmd_req *req,
> +				  struct mbx_fw_cmd_reply *reply)
> +{
> +	int len = le16_to_cpu(req->datalen) + MBX_REQ_HDR_LEN;
> +	int retry_cnt = 3;
> +	int err;
> +
> +	err = mutex_lock_interruptible(&hw->mbx.lock);
> +	if (err)
> +		return err;
> +	err = hw->mbx.ops->write_posted(hw, (u32 *)req,
> +					L_WD(len));
 > +	if (err) {> +		mutex_unlock(&hw->mbx.lock);
> +		return err;
> +	}

it might look a bit cleaner if you add error label and have unlock code
once in the end of the function...

> +	do {
> +		err = hw->mbx.ops->read_posted(hw, (u32 *)reply,
> +					       L_WD(sizeof(*reply)));
> +		if (err) {
> +			mutex_unlock(&hw->mbx.lock);
> +			return err;
> +		}
> +	} while (--retry_cnt >= 0 && reply->opcode != req->opcode);
> +	mutex_unlock(&hw->mbx.lock);
> +	if (retry_cnt < 0 || reply->error_code)
> +		return -EIO;
> +	return 0;
> +}
> +
> +/**
> + * mucse_fw_get_capability - Get hw abilities from fw
> + * @hw: pointer to the HW structure
> + * @abil: pointer to the hw_abilities structure
> + *
> + * mucse_fw_get_capability tries to get hw abilities from
> + * hw.
> + *
> + * @return: 0 on success, negative on failure
> + **/
> +static int mucse_fw_get_capability(struct mucse_hw *hw,
> +				   struct hw_abilities *abil)
> +{
> +	struct mbx_fw_cmd_reply reply;
> +	struct mbx_fw_cmd_req req;
> +	int err;
> +
> +	memset(&req, 0, sizeof(req));
> +	memset(&reply, 0, sizeof(reply));

probably

	struct mbx_fw_cmd_reply reply = {};
	struct mbx_fw_cmd_req req = {};

will look better. in the other functions as well..



