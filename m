Return-Path: <linux-doc+bounces-78793-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCRrD2b2sGmHpAIAu9opvQ
	(envelope-from <linux-doc+bounces-78793-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 05:58:14 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066825C1A4
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 05:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F22C83058E07
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2026 04:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D92F363B;
	Wed, 11 Mar 2026 04:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hjIHq9OY"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F528CF4A;
	Wed, 11 Mar 2026 04:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205085; cv=none; b=qHbLvruA26dDDlNOwJBdv6EBtzi3PaUyzVMfaTL0caHwjJJvgNGhaosszUWqMBWKpDREZJfKjLQslG7kpyt8gOS/ZwyZBl/evK4qy0tyWxnC3kCRnnIy0+E14SDSxpuTzelXQ43KqbOgwVhRshr0GPjF+pWr0BX2cxR7MU1rUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205085; c=relaxed/simple;
	bh=PPh4p9TMc+yxFwkeztcG783ewgHhUQ6b37NDTTtBG3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdMUJjYPI6g+lXmNgrsGA94tPsvSUVql7ro9F8sNoQtql3TwPb1U2L2bzqo0ko9eOoccl+zPvKrv9e8Wqqwaxevqs7X6fh/rkxxE/jgqh0sH5N6khAf0feu0nAXcPgFz4W4vFvZ01EpBBU8EzkPiRYgfesonrXt4tTXe2sjAL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hjIHq9OY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=x4A282qbKiRaDxLxOFzUvZJlDLVzn+npN+jW3VDUXrE=; b=hjIHq9OYwLwYJpDalYhfPrzXgC
	fyNofX/OBHVH67n+dAMxVVn9PSIktXrzt5b/om/maLaVIeM91UDTTAlKnlmns16dGM7ZAKe8GE3TL
	uuKGUdja0Acc5n1UqeBzA2AANOZKsavxSPT48jll7+0DmNvkH8y5dqv8ejOUbAmbZTB9IxDs9mxIS
	bouzsfyj0jym4IjMr8wMFzD6+UQMlDTOsf0IWXN/ZJftizUSkHSPgHEyUCakHGsVounLWaB9+9usX
	VtTfJ8SgYcYHN3iTJspdMI7xt2+RfUPGnLDEv6rkXLoWGZo7jlp3VwSD5bxwrZcr5XotG8y/P1/24
	KZLRLynQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Bdm-0000000Ak0P-2oiL;
	Wed, 11 Mar 2026 04:57:50 +0000
Message-ID: <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
Date: Tue, 10 Mar 2026 21:57:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, W_Armin@gmx.de,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7066825C1A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78793-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[tuxedocomputers.com,gmx.de,kernel.org,linux.intel.com,lwn.net,linuxfoundation.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gmx.de:email,infradead.org:dkim,infradead.org:email,infradead.org:mid]
X-Rspamd-Action: no action

Hi Werner,

On 3/10/26 4:34 PM, Werner Sembach wrote:
> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>  .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>  2 files changed, 37 insertions(+)
> 


Can you give me a lore.kernel.org URL or a message-ID in which
I replied with a "Reviewed-by:" tag for this patch, please?
I don't recall doing so, but I could have.

thanks.
-- 
~Randy


