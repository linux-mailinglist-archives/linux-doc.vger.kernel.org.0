Return-Path: <linux-doc+bounces-60963-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9BB7FDCA
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 16:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499353BD975
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 14:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163EC32B49F;
	Wed, 17 Sep 2025 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cjifK6Lx"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDD3195FF
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117756; cv=none; b=U5J2GBXUcFT+rsQU4XCHFXE8+zOrxDT1ebU5NX2LrRDKsj37/tCjbK79qC+79eP0awtIWmb7tIjBgbFBJNlqcFL42RrE8UUIxgaYADlrzCx2MZabWWQuUMih0+iYvCbHZroLrr3Fu1tTUvI5wasLAjryg6jhx6gKY0r8TOHic+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117756; c=relaxed/simple;
	bh=7TiAvhoxjdDJ9926V3sOvAKk26WqBwI6H6/qxKaTiKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5QRQy7oIo4jW0Vqi8cTrt19urrk7HkM+VfOCMBOKrh7M4VvCfnYHN4R3ddJLYFpNZXjw008j9WcaDg/8DrPFzs/0PB+L66jRVz4rWGrseLbXcflX52Sm+r8bSt2WKc8cF2zNH1kZRu0qTR6pgYEph8m7+b2vIEPltPgjk+m9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cjifK6Lx; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fb8f876a-c2e5-49b0-bc64-bdf18ecd1ce4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758117741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/ue3/sXjmvdvdQFAqXQjLB/iQKQuwbWzhj6HJ39M4g=;
	b=cjifK6Lxyaq7pAGByYUG4K5GmXgVrf/NCA4b2FP2O0PavT3ThCl+VDlgKiT0yb3O+DF1mL
	cUneofJJYsTwOCUz0/BA+CHAK1I3nWmNZ8msmaHa86fX6fuVLnlLV+K85o+Uzc9OH+20Yn
	OmPpifN0D7NifLM/lrmKSDDYX8Bj/CA=
Date: Wed, 17 Sep 2025 15:02:13 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v12 4/5] net: rnpgbe: Add basic mbx_fw support
To: Yibo Dong <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 gur.stavi@huawei.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 danishanwar@ti.com, lee@trager.us, gongfan1@huawei.com, lorenzo@kernel.org,
 geert+renesas@glider.be, Parthiban.Veerasooran@microchip.com,
 lukas.bulwahn@redhat.com, alexanderduyck@fb.com, richardcochran@gmail.com,
 kees@kernel.org, gustavoars@kernel.org, rdunlap@infradead.org,
 joerg@jo-so.de, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250916112952.26032-1-dong100@mucse.com>
 <20250916112952.26032-5-dong100@mucse.com>
 <3058c061-3a17-4077-8d4e-c91ad72b3831@linux.dev>
 <D7EC5E8B6F6E685E+20250917110540.GA91482@nic-Precision-5820-Tower>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <D7EC5E8B6F6E685E+20250917110540.GA91482@nic-Precision-5820-Tower>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 17/09/2025 12:05, Yibo Dong wrote:
> On Wed, Sep 17, 2025 at 11:45:31AM +0100, Vadim Fedorenko wrote:
>> On 16/09/2025 12:29, Dong Yibo wrote:
>>> Add fundamental firmware (FW) communication operations via PF-FW
>>> mailbox, including:
>>> - FW sync (via HW info query with retries)
>>> - HW reset (post FW command to reset hardware)
>>> - MAC address retrieval (request FW for port-specific MAC)
>>> - Power management (powerup/powerdown notification to FW)
>>>
>>> Signed-off-by: Dong Yibo <dong100@mucse.com>
>>
>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>
>> small nits below
>>
>>
>>> +static void build_get_hw_info_req(struct mbx_fw_cmd_req *req)
>>> +{
>>> +	req->flags = 0;
>>> +	req->opcode = cpu_to_le16(GET_HW_INFO);
>>> +	req->datalen = cpu_to_le16(MUCSE_MBX_REQ_HDR_LEN);
>>> +	req->reply_lo = 0;
>>> +	req->reply_hi = 0;
>>> +}
>>
>> All these build*() functions re-init flags and reply to 0, but all
>> mbx_fw_cmd_req are zero-inited on the stack. Might be better clean
>> things assignments, but no strong opinion because the code is explicit
>>
>> If you will think of refactoring this part, it might be a good idea to
>> avoid build*() functions at all and do proper initialization of
>> mbx_fw_cmd_req in callers?
>>
>>> +
>>> +/**
>>> + * mucse_mbx_get_info - Get hw info from fw
>>> + * @hw: pointer to the HW structure
>>> + *
>>> + * mucse_mbx_get_info tries to get hw info from hw.
>>> + *
>>> + * Return: 0 on success, negative errno on failure
>>> + **/
>>> +static int mucse_mbx_get_info(struct mucse_hw *hw)
>>> +{
>>> +	struct mbx_fw_cmd_reply reply = {};
>>> +	struct mbx_fw_cmd_req req = {};
>>
>> something like:
>>
>> struct mbx_fw_cmd_req req =
>> 	{
>> 	  .opcode = cpu_to_le16(GET_HW_INFO),
>> 	  .datalen = cpu_to_le16(MUCSE_MBX_REQ_HDR_LEN),
>> 	}
>>
>>
>>
> 
> That's a good idea! That makes the code more compact.
> I think I should update this as your suggestion.
> 
> Regarding adding your "Reviewed-by" tag in the next version:
> Would it be acceptable to include it when I submit the updated patch (with
> the initialization logic adjusted), or should I wait for your further
> review of the modified code first?

If you will submit another version with this refactoring, I'll better do
another review.

