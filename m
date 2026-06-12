Return-Path: <linux-doc+bounces-92102-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pNJYGkTbK2oNGgQAu9opvQ
	(envelope-from <linux-doc+bounces-92102-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 12:11:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9926789B3
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 12:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=guKyFSl+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92102-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92102-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5281303C7EA
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0D23A7F4C;
	Fri, 12 Jun 2026 10:11:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B006374E62
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 10:11:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259071; cv=none; b=C9RWMmt8S/fEVLGKrZFdsP220eWCPtFD2RD/ZsxebIgeoo3FavReEpdzaouLVN/wcvsPL6VfnGurx/Mpx4uXdsNG4HIvUSNN/9qFQQv5L+YWUWblD4biSseeG0aQqGfLvKWZA14hTzY8rSDB0wBnqToeQjm7oxEjHJFsg0ILlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259071; c=relaxed/simple;
	bh=BbsZrou20noZ1eCteTU+al1EUZ4Kgg/aMc/ruF0xQ9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlNKKm/sFL59pO+5I0CCLt2FhCIlOxQsft3mYGYlTCsqiLT5mU8GUKhgHYtBKB60lrJhSHKgnejKR6ToaL2Wj4ZMI9nbia9Y5RCIrtOZRWMo/Qa7wfd6+OO1hPmfpku71TVXHBt8Itr9eT7XpeWAbXJYzF41Hn+a05QtoO5izz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=guKyFSl+; arc=none smtp.client-ip=91.218.175.178
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781259067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzS/kGsf92jGqEw0Cpbkdc2ZLCTfp0DBUP+QupYpFLE=;
	b=guKyFSl+UfdPsiPAbmsBFksClDnPER66iuQB/0VZpZJUYxSrmZUSvQkFzz3h2a3Lx8j05t
	Mg/rTo7oVaCNm32etcLTuHF0fUxBA0+XD/Wkq8RGVtxTCIO1nMAbACU0bzNJoxSQ93GPca
	qOT4RlCNTcqwnOuHkVESEpSONHkhYO0=
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
Subject: Re: [PATCH v3 01/24] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Fri, 12 Jun 2026 03:10:59 -0700
Message-ID: <20260612101100.186627-1-usama.arif@linux.dev>
In-Reply-To: <20260329163337.637393-2-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92102-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD9926789B3

On Sun, 29 Mar 2026 17:33:12 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMIv4.0 introduces a couple of new possible protocol error codes: add
> the needed definitions and mappings to Linux error values.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 7c35c95fddba..44af2018e21d 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -45,6 +45,8 @@ enum scmi_error_codes {
>  	SCMI_ERR_GENERIC = -8,	/* Generic Error */
>  	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
>  	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
>  };
>  
>  static const int scmi_linux_errmap[] = {
> @@ -60,6 +62,8 @@ static const int scmi_linux_errmap[] = {
>  	-EIO,			/* SCMI_ERR_GENERIC */
>  	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
>  	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> +	-EPERM,			/* SCMI_ERR_IN_USE */

"In use" reads like a resource-state failure, where -EBUSY would normally be expected.
-EPERM suggests an authorization failure,  which is already represented by SCMI_ERR_ACCESS.

> +	-EINVAL,		/* SCMI_ERR_PARTIAL */
>  };
>  
>  static inline int scmi_to_linux_errno(int errno)
> -- 
> 2.53.0
> 
> 

