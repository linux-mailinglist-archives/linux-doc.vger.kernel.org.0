Return-Path: <linux-doc+bounces-92368-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fn+oCZOuL2rmEQUAu9opvQ
	(envelope-from <linux-doc+bounces-92368-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 09:49:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13968450F
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 09:49:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=kyiydL8a;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92368-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92368-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE736301112A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 07:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F098026ED41;
	Mon, 15 Jun 2026 07:48:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A1C1D5CC6;
	Mon, 15 Jun 2026 07:48:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509734; cv=none; b=Ro7IF03HChwO9VramKHHS6t2nhgoWgd0jeaO2BlRQc9oYQVDGna16qAKHc0DGy5atj2HFWb1ao+/t91G3Vz9eVahBddLKrWR4M4k/RMqu0DQDtE3+jo+J4Lhh+ihvyQemphafTM+AvRj9H93ghefHnoKCcKy4fQ+U6Flwyoijf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509734; c=relaxed/simple;
	bh=130tyfKNAu8zFNvpSe774fd5eUuTFedAwCdY4KRvrSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7OWIdRqRmZ4pvcs5yIxMhZyrNSrnOatMscfHo7iul53R80QxzbCQSYLBCUbAxEg16M7xJFArsdt5tg7IUkzYsBSa3YH5M5CwP+/5vE+J8mzerRYBcqDQM2re1q7+Gdn/xfZe+r9tkngUU30C4q1xhH1xUzFGzq66cbfIWGbFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kyiydL8a; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A648B1BB0;
	Mon, 15 Jun 2026 00:48:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8FB3F915;
	Mon, 15 Jun 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781509732; bh=130tyfKNAu8zFNvpSe774fd5eUuTFedAwCdY4KRvrSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyiydL8atDQFxvv44Y2T47BtPwkChp6i8KbAY2qG3IiXhk81dgtB+wRbDrRfONhLs
	 3DZ+wt7i+EIKKU+wNfEzriO1S+/acmyKG8r4OfnRoWfqMxSxMQHaNUs6Id9cvTKEbC
	 y2qZs4mvkZEN4l81i7dTAzMS42Ud3bVtt/+bKfkg=
Date: Mon, 15 Jun 2026 08:48:35 +0100
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
Subject: Re: [PATCH v3 02/24] firmware: arm_scmi: Reduce the scope of
 protocols mutex
Message-ID: <ai-uQZasZR_MCgSn@pluto>
References: <20260329163337.637393-3-cristian.marussi@arm.com>
 <20260612101525.340337-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612101525.340337-1-usama.arif@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92368-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pluto:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C13968450F

On Fri, Jun 12, 2026 at 03:15:24AM -0700, Usama Arif wrote:
> On Sun, 29 Mar 2026 17:33:13 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Currently the mutex dedicated to the protection of the list of registered
> > protocols is held during all the protocol initialization phase.
> > 
> > Such a wide locking region is not needed and causes problem when trying to
> > initialize notifications from within a protocol initialization routine.
> > 
> > Reduce the scope of the protocol mutex.
> 
> I think this changes more than the mutex scope. scmi_get_protocol_instance()
> can now drop protocols_mtx after idr_find() while scmi_protocol_release()
> can concurrently drop the final reference, remove the IDR entry, and release
> the devres group. Does that leaves a use-after-free window around the returned
> pi?
> 

I have to review this mechanism in general in V5 so I will get back to
you on this once I have refreshed my memory on this own code of mine :P

Thanks,
Cristian

