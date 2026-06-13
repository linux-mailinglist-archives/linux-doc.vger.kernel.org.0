Return-Path: <linux-doc+bounces-92255-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/LVOfLrLGpBXgQAu9opvQ
	(envelope-from <linux-doc+bounces-92255-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 07:34:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACB67DC97
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 07:34:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=fLPmw9vF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92255-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92255-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3791E30CA14E
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 05:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E843D3328;
	Sat, 13 Jun 2026 05:28:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B963CAA2E;
	Sat, 13 Jun 2026 05:28:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328490; cv=none; b=b/VYmpoKRFFNePP7DAJj8R06nqbaW0YsjzVgltzvIi5fhD9Zz/oQtQCKBRCq5k4p/Ga56ns8btAITGDbbGeQPo+a7S0anz/VgDnYpOCs2QDBjzEdMykgYttwTO+N1RCb5s/v0j0nD4plyghbQ+HZl2v/+xy+4jZ4dH4XYQqF3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328490; c=relaxed/simple;
	bh=F0cyY49RatAxk6HHMWOuyq05wFIxYcoBs1nXdtxvJF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/ZrevjmnGj/SXrS8H8yPb1QX9nsO9Lb7i8ooSm3pcrbPz19TgpBijSfQOVnWisVEo8R4cHojAlqQ63r/7Phgqcy/U+P0CavklU3YTgZ82cPpJXtUI6N8poY9qBTl+kAg3YJaNpCiKGl6yFaIsooio/DG5LwS4ugikm360qjGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fLPmw9vF; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=y4/6Lc/+651vbxRHr5V6jKndyAO/QJF1z4yHsnYQ6O0=; b=fLPmw9vFRYdes5FAmLXwOqHfHu
	dl5TeojJJUxLlXW46s+5FRhAo0FBBofNc7u4DwgEUxdkbYln+LLANdedVoPsgYHF3dLaWgtCkJW9S
	OgaJLOJ86f8ilHO/A26CcxwDDpv6ShE+bz76fXjlAIqLgPSWIrLjKWC+zPdIP/BQ/ranbKgS8gDq4
	RZdN1m0BJaq37TL0DbEHQ0ah3YAt1AEYbv98DX+avFRLulcAVrorLw5o4oI0nkV4nmy3VeoNjvplN
	A18cYMEV9NTC2MObQFAnyBqHooHCXM0Nd6NlcCD/YFCJbGyvy2qwG+2Lf89KS9pg6SNy/G/2rrwPa
	00/zu3tQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGuU-0000000By85-3rEg;
	Sat, 13 Jun 2026 05:27:59 +0000
Message-ID: <bcd5576a-5d4c-44f6-a773-2344ba8c6432@infradead.org>
Date: Fri, 12 Jun 2026 22:27:57 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/31] fs/stlmfs: Document ARM SCMI Telemetry
 filesystem
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 brauner@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
 kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
 kernel-team@meta.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260612223802.1337232-21-cristian.marussi@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612223802.1337232-21-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92255-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62ACB67DC97



On 6/12/26 3:37 PM, Cristian Marussi wrote:

> +Design
> +======
> +
> +STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
> +discovered dynamically at run-time via SCMI.
> +
> +Inodes are all dynamically created at mount-time from a dedicated
> +kmem_cache based on the gathered available SCMI Telemetry information.
> +
> +Since inodes represent the discovered Telemetry entities, which in turn are
> +statically defined at the platform level and immutable throughout the same
> +session (boot), allocated inodes are freed only at unmount-time and the
> +user is not allowed to delete or create any kind of file within the STLMFS
> +filesystem after mount has completed.
> +
> +A single instance of STLMFS is created at the filesystem level, using
> +get_tree_single(), given that the same SCMI backend entities will be
> +involved no matter how many times you mount it.
> +
> +STLMFS configurations gets appplied by issuing the related SCMI commands to

                         get applied
or better:
                         are applied

> +the backend SCMI platform server: for such reason any configuration applied
> +by this FS interface will survive the unmount or the unload of the module, but
> +not a reboot.

-- 
~Randy


