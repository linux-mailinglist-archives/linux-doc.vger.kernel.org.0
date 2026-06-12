Return-Path: <linux-doc+bounces-92104-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mKKFMlbcK2pZGgQAu9opvQ
	(envelope-from <linux-doc+bounces-92104-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 12:15:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76B678A37
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 12:15:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=EQoBDBvf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92104-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92104-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D73B0305FAD6
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524488248B;
	Fri, 12 Jun 2026 10:15:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14736EAAC;
	Fri, 12 Jun 2026 10:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259336; cv=none; b=cFGSTXiTmZ8Uy582wrEpsH896MBE572cNTHEvvr0vMF3jFtcYimxsJ7UsTb9vXTRxCOtomQmT1OC30DDDsHMzWHAywtUKftHKM0OkL11WCQ6UuZjn5+gkKkD6oH0Tf4OplGPRcgZsisAdAC4XaoB0mEJbJ1U11z/63qEjyH/jB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259336; c=relaxed/simple;
	bh=WtwFBdcoNgVFnGaN7wYg5bPQTbJzZm3o2CtR/JVfPBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSNSziZ3B3EKbA9wBWMaQLbgymwAsPaxGmy8l6JYrsxFNxzjSHx84ysA5SLkvja0o8SSkznka4PAOn79tfMCCPAYmvBswAmIEHROFseApU03IiBXCZTif1n5wab6HH3S5QsTuqwwcF+S+TCQLRtjXUVOrhU2OIMdVqNuvirW++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EQoBDBvf; arc=none smtp.client-ip=91.218.175.171
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781259331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNePmwoejC9uECBwHhyf9ZCMhy83FpHG4lebaOpVm0M=;
	b=EQoBDBvfHYiavI3vA2yTca4fC+KP7Jdm89S9rgLab6eg/3U8UnakmhSUbwGwZXDhFNXHC6
	UZM2hqGg6Ri/TRseT5+w2zgSq53/sECP1UOqvX1emDa6+r7eJb9ro5J0Rmcp5qLbKDjRNd
	XJoXg1rwWDXdr8bCEpzg3cCWhsGHzak=
From: Usama Arif <usama.arif@linux.dev>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v3 02/24] firmware: arm_scmi: Reduce the scope of protocols mutex
Date: Fri, 12 Jun 2026 03:15:24 -0700
Message-ID: <20260612101525.340337-1-usama.arif@linux.dev>
In-Reply-To: <20260329163337.637393-3-cristian.marussi@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92104-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:usama.arif@linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:dan.carpenter@linaro.org,m:d-gole@ti.com,m:jonathan.cameron@huawei.com,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,lists.infradead.org,kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,huawei.com,arm.com];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C76B678A37

On Sun, 29 Mar 2026 17:33:13 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:

> Currently the mutex dedicated to the protection of the list of registered
> protocols is held during all the protocol initialization phase.
> 
> Such a wide locking region is not needed and causes problem when trying to
> initialize notifications from within a protocol initialization routine.
> 
> Reduce the scope of the protocol mutex.

I think this changes more than the mutex scope. scmi_get_protocol_instance()
can now drop protocols_mtx after idr_find() while scmi_protocol_release()
can concurrently drop the final reference, remove the IDR entry, and release
the devres group. Does that leaves a use-after-free window around the returned
pi?


> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v1-->v2
>  - Fixed improper mixed usage of cleanup and goto constructs
> ---
>  drivers/firmware/arm_scmi/driver.c | 50 ++++++++++++++----------------
>  1 file changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e76a3204ba4..26f192b8d7a9 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -17,6 +17,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/bitmap.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/export.h>
> @@ -2190,7 +2191,6 @@ static void scmi_protocol_version_initialize(struct device *dev,
>   * all resources management is handled via a dedicated per-protocol devres
>   * group.
>   *
> - * Context: Assumes to be called with @protocols_mtx already acquired.
>   * Return: A reference to a freshly allocated and initialized protocol instance
>   *	   or ERR_PTR on failure. On failure the @proto reference is at first
>   *	   put using @scmi_protocol_put() before releasing all the devres group.
> @@ -2236,8 +2236,10 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	if (ret)
>  		goto clean;
>  
> -	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
> -			GFP_KERNEL);
> +	/* Finally register the initialized protocol */
> +	mutex_lock(&info->protocols_mtx);
> +	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1, GFP_KERNEL);
> +	mutex_unlock(&info->protocols_mtx);
>  	if (ret != proto->id)
>  		goto clean;
>  
> @@ -2284,27 +2286,25 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  static struct scmi_protocol_instance * __must_check
>  scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
>  {
> -	struct scmi_protocol_instance *pi;
>  	struct scmi_info *info = handle_to_scmi_info(handle);
> +	const struct scmi_protocol *proto;
>  
> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> -
> -	if (pi) {
> -		refcount_inc(&pi->users);
> -	} else {
> -		const struct scmi_protocol *proto;
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		struct scmi_protocol_instance *pi;
>  
> -		/* Fails if protocol not registered on bus */
> -		proto = scmi_protocol_get(protocol_id, &info->version);
> -		if (proto)
> -			pi = scmi_alloc_init_protocol_instance(info, proto);
> -		else
> -			pi = ERR_PTR(-EPROBE_DEFER);
> +		pi = idr_find(&info->protocols, protocol_id);
> +		if (pi) {
> +			refcount_inc(&pi->users);
> +			return pi;
> +		}
>  	}
> -	mutex_unlock(&info->protocols_mtx);
>  
> -	return pi;
> +	/* Fails if protocol not registered on bus */
> +	proto = scmi_protocol_get(protocol_id, &info->version);
> +	if (!proto)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return scmi_alloc_init_protocol_instance(info, proto);
>  }
>  
>  /**
> @@ -2335,10 +2335,11 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  	struct scmi_info *info = handle_to_scmi_info(handle);
>  	struct scmi_protocol_instance *pi;
>  
> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> -	if (WARN_ON(!pi))
> -		goto out;
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		pi = idr_find(&info->protocols, protocol_id);
> +		if (WARN_ON(!pi))
> +			return;
> +	}
>  
>  	if (refcount_dec_and_test(&pi->users)) {
>  		void *gid = pi->gid;
> @@ -2357,9 +2358,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
>  			protocol_id);
>  	}
> -
> -out:
> -	mutex_unlock(&info->protocols_mtx);
>  }
>  
>  void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
> -- 
> 2.53.0
> 
> 

