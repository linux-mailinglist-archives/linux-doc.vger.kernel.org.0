Return-Path: <linux-doc+bounces-82112-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCGBFM5OzWkWbwYAu9opvQ
	(envelope-from <linux-doc+bounces-82112-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 18:58:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4737E4A1
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 18:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F56C301110A
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2026 16:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E24477987;
	Wed,  1 Apr 2026 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TANrpt4y"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FC41B362
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061462; cv=none; b=bfAdFW1Li0i2p1hgGfQwrV0JJ4ehHqhag+dDcNEtiebcvXlgRkj2F4Rzb3H9rieA5DWa15SLBC/hzdmGlMbke/f/xfl5VQp5cIFlSublTw6BrDjm9VMXWVbqv/N7bQseikhIsZGxSJ+NMWkeC9XMS5FDe+38Bnx1uf9HxhDehps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061462; c=relaxed/simple;
	bh=nuoQhq0m6dI/iXvqGriSqSvBUUReXI7pTT5nO34AccU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQb9XQ+VONsjeZR87rIwBg9E+fdG02QJAgnOqmzZb1UGYrDXuGzPQ6zFFDJXGMkJNtHpYwweI2AJjuLZ5kIfQ8XMNiccpIhZaCH2bF+isvY6JHx+ZLk+0sTuKzzvbtoWACtxvgMYnWaVciDwzi+NcQZL5MDrPdipi4e3daZMh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TANrpt4y; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <360f36e2-4ff9-4707-b661-be242970811d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775061452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ok/UIDzQfKSCTfq4WRzgEXWxUjOMvqRKwtV5Slboj8g=;
	b=TANrpt4yphvmQ4ahVR/spQ0/y1JrAGnaBmDSYOzpAfxCl9HyAQRXQFCN4JUISRc+fEfxAj
	VMRGzA+y+uNsD4WfICae9yi5mePINQqVTVCa5Y19KKFqK1Z9ND8twQJUhsXTFALUCsxHYb
	BmYCgzYaVoCSyGscnzP/3zr4MLVMUbY=
Date: Wed, 1 Apr 2026 17:37:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 2/3] dpll: add frequency monitoring callback
 ops
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Michal Schmidt <mschmidt@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Petr Oros <poros@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401091237.1071995-1-ivecera@redhat.com>
 <20260401091237.1071995-3-ivecera@redhat.com>
 <ccb93d19-19a9-4dd9-8ac7-e0d41dbb884d@linux.dev>
 <CE3CDF40-CA7B-43A5-9DBD-A04FA37F4E57@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <CE3CDF40-CA7B-43A5-9DBD-A04FA37F4E57@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82112-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,davemloft.net,gmail.com,google.com,kernel.org,resnulli.us,lwn.net,redhat.com,microchip.com,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vadim.fedorenko@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 9EE4737E4A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 17:29, Ivan Vecera wrote:
> Hi Vadim,
> 
> 1. dubna 2026 16:47:21 SELČ, Vadim Fedorenko <vadim.fedorenko@linux.dev> napsal:
>> On 01/04/2026 10:12, Ivan Vecera wrote:
>>> Add new callback operations for a dpll device:
>>> - freq_monitor_get(..) - to obtain current state of frequency monitor
>>>     feature from dpll device,
>>> - freq_monitor_set(..) - to allow feature configuration.
>>>
>>> Add new callback operation for a dpll pin:
>>> - measured_freq_get(..) - to obtain the measured frequency in mHz.
>>>
>>> Obtain the feature state value using the get callback and provide it to
>>> the user if the device driver implements callbacks. The measured_freq_get
>>> pin callback is only invoked when the frequency monitor is enabled.
>>> The freq_monitor_get device callback is required when measured_freq_get
>>> is provided by the driver.
>>>
>>> Execute the set callback upon user requests.
>>>
>>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>>> ---
>>> Changes v2 -> v3:
>>> - Made freq_monitor_get required when measured_freq_get is present (Jakub)
>>>
>>> Changes v1 -> v2:
>>> - Renamed actual-frequency to measured-frequency (Vadim)
>>> ---
>>>    drivers/dpll/dpll_netlink.c | 92 +++++++++++++++++++++++++++++++++++++
>>>    include/linux/dpll.h        | 10 ++++
>>>    2 files changed, 102 insertions(+)
>>>
>>> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>>> index 83cbd64abf5a4..576d0cd074bd4 100644
>>> --- a/drivers/dpll/dpll_netlink.c
>>> +++ b/drivers/dpll/dpll_netlink.c
>>> @@ -175,6 +175,26 @@ dpll_msg_add_phase_offset_monitor(struct sk_buff *msg, struct dpll_device *dpll,
>>>    	return 0;
>>>    }
>>>    +static int
>>> +dpll_msg_add_freq_monitor(struct sk_buff *msg, struct dpll_device *dpll,
>>> +			  struct netlink_ext_ack *extack)
>>> +{
>>> +	const struct dpll_device_ops *ops = dpll_device_ops(dpll);
>>> +	enum dpll_feature_state state;
>>> +	int ret;
>>> +
>>> +	if (ops->freq_monitor_set && ops->freq_monitor_get) {
>>> +		ret = ops->freq_monitor_get(dpll, dpll_priv(dpll),
>>> +					    &state, extack);
>>> +		if (ret)
>>> +			return ret;
>>> +		if (nla_put_u32(msg, DPLL_A_FREQUENCY_MONITOR, state))
>>> +			return -EMSGSIZE;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int
>>>    dpll_msg_add_phase_offset_avg_factor(struct sk_buff *msg,
>>>    				     struct dpll_device *dpll,
>>> @@ -400,6 +420,40 @@ static int dpll_msg_add_ffo(struct sk_buff *msg, struct dpll_pin *pin,
>>>    			    ffo);
>>>    }
>>>    +static int dpll_msg_add_measured_freq(struct sk_buff *msg, struct dpll_pin *pin,
>>> +				      struct dpll_pin_ref *ref,
>>> +				      struct netlink_ext_ack *extack)
>>> +{
>>> +	const struct dpll_device_ops *dev_ops = dpll_device_ops(ref->dpll);
>>> +	const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>> +	struct dpll_device *dpll = ref->dpll;
>>> +	enum dpll_feature_state state;
>>> +	u64 measured_freq;
>>> +	int ret;
>>> +
>>> +	if (!ops->measured_freq_get)
>>> +		return 0;
>>> +	if (WARN_ON(!dev_ops->freq_monitor_get))
>>> +		return -EINVAL;
>>
>> I think pin registration function has to be adjusted to not allow
>> measured_freq_get() callback if device doesn't have freq_monitor_get()
>> callback (or both freq_monitor_{s,g}et). Then this defensive part can
>> be completely removed.
> 
> Ok, make sense... Will move such check to pin registration function...
> 
> Q: with WARN_ON or without?

Well, we have to provide reason for blocking device registration
somehow, and the only way to this is via "WARN_ON"...

> 
> Thanks
> Ivan
> 


