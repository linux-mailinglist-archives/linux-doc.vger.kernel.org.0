Return-Path: <linux-doc+bounces-92367-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1+JN+utL2rJEQUAu9opvQ
	(envelope-from <linux-doc+bounces-92367-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 09:46:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4FC6844D8
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 09:46:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=fzKvQYgj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92367-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92367-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F232D3031009
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 07:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E123BFADD;
	Mon, 15 Jun 2026 07:45:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC6530C17B;
	Mon, 15 Jun 2026 07:45:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509513; cv=none; b=McHRb/XDjK+vI4m9gUlTQN8CL6JNsKzwEJbn22eNq9KZpweooZwYkTRbHf0mcKb3WQD9a6cbbs6goTF3x9zP9sEyLYuzZ6HtR2c8konfeVjGvQZLRQak26GAK8XFcQYggtLNrWIX02UzfyQJvVXJX/qG11+XSYZf5xs6bSm3Wz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509513; c=relaxed/simple;
	bh=S3aesdr6kLsMUr3xS9pG14iz/MosAT4l49e0wdffs74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntM0sQ1+C3jrt9GL6IWtBjKnyW0uHdYxjUXTvqVdcMcQ4sFISe1KrSekc2uTOS5G4Xn8mPKryNRUmPk7uAnXHuCA/4WpKehzM34hgk7SA9ezNpZsdpBAktuVjoj88gkRPQJgCqOwdo/Zz8i6VVZchOEb1rspq1VYVpODPvlAVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fzKvQYgj; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFA171BB0;
	Mon, 15 Jun 2026 00:44:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50F153F915;
	Mon, 15 Jun 2026 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781509504; bh=S3aesdr6kLsMUr3xS9pG14iz/MosAT4l49e0wdffs74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzKvQYgj2iF4lrktbW85bXMa+pjivHU/qBOlR1WbOnnjLYmME7Tp1Afkh4vR5bR3R
	 Xk7sbfqqXI1biKbxPrUDKsMsI3DqmYJ/wy1gFhSbIyf6ezFz7cU3VxpEVE6FxIkLUl
	 kVuEJpT4atyv2vAFewU3n7onhcjNKa/r06KPy/9A=
Date: Mon, 15 Jun 2026 08:44:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v3 01/24] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <ai-tXclzfL9CkGkq@pluto>
References: <20260329163337.637393-2-cristian.marussi@arm.com>
 <20260612101100.186627-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612101100.186627-1-usama.arif@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92367-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:cristian.marussi@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:dan.carpenter@linaro.org,m:d-gole@ti.com,m:jonathan.cameron@huawei.com,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,huawei.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,pluto:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A4FC6844D8

On Fri, Jun 12, 2026 at 03:10:59AM -0700, Usama Arif wrote:
> On Sun, 29 Mar 2026 17:33:12 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Hi Usama,

Thanks for having a look at this first of all !

I was busy posting a V4 before merge window last week so this late
reply....

I am already planning a V5 in -rc1 in two weeks where beside some more
minor ABI additions I will plan to address any incoming reviews and
some residual minor issues I know about (mostly sparse related)

...but you are CCed already in V4...

> > SCMIv4.0 introduces a couple of new possible protocol error codes: add
> > the needed definitions and mappings to Linux error values.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index 7c35c95fddba..44af2018e21d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -45,6 +45,8 @@ enum scmi_error_codes {
> >  	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> >  	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> >  	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> > +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> > +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> >  };
> >  
> >  static const int scmi_linux_errmap[] = {
> > @@ -60,6 +62,8 @@ static const int scmi_linux_errmap[] = {
> >  	-EIO,			/* SCMI_ERR_GENERIC */
> >  	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> >  	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> > +	-EPERM,			/* SCMI_ERR_IN_USE */
> 
> "In use" reads like a resource-state failure, where -EBUSY would normally be expected.
> -EPERM suggests an authorization failure,  which is already represented by SCMI_ERR_ACCESS.
> 

The usage of this in Telemetry is indeed a resource state failure that relates to groups usage
and it means something like "this is busy now, so you cannot do that now with this current config"
...but you are definitely right that -EPERM does NOT fit well here and especially is NOT what IN_USE
should signify in general in SCMI as a return code for future users.

I will fix in V5.

Thanks,
Cristian

