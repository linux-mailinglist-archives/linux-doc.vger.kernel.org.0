Return-Path: <linux-doc+bounces-76492-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL8rM37/mmlKpQMAu9opvQ
	(envelope-from <linux-doc+bounces-76492-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 14:07:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F8516F1DC
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 14:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC0A6300B182
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF41F23D2A1;
	Sun, 22 Feb 2026 13:07:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C091EB5F8;
	Sun, 22 Feb 2026 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771765626; cv=none; b=sLkawoWB/WInsfeC4ahGUxpuv9imHiUcgolz6cQ43e4r6gjf4IKOAGw3tjgm8qFpDg1xL0J+Lxbz6BsRnydSbNRaGGR4VQ+t6q7ATarWb0TuTgEGmEZgRqpeeps4bXbSuvlgpaa8PZXbs/kSQ953mqLeFyaVOTNJlXE7YSirSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771765626; c=relaxed/simple;
	bh=IB0vTf1ok/9bz8OTUdwo2iavt6xyOws666hF9uOTCKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2+llR51VK6XLcMOWUjSM+j6JHnhc6NDZEX/VZ5EECazIQHQJcSqacdBrIHk9a/R2fGWlIjA0/izlHw2jCarpvcKHp7x4rPCBa3d3G7FlWA7tVxtek5vKwGzKHakV7QgsLKSS8LmJZquljjrcBNdBgZpJShTatT7trlmqb6dqAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 666F1203064F;
	Sun, 22 Feb 2026 14:06:56 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 557734C89A; Sun, 22 Feb 2026 14:06:56 +0100 (CET)
Date: Sun, 22 Feb 2026 14:06:56 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, cassel@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 3/4] PCI/DOE: Add DOE mailbox support for endpoint
 functions
Message-ID: <aZr_cD9LIQgvywri@wunner.de>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-4-a-garg7@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-4-a-garg7@ti.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76492-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74F8516F1DC
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 06:06:02PM +0530, Aksh Garg wrote:
> Add the DOE support for PCIe endpoint devices, enabling endpoint
> functions to process the DOE requests from the host. The implementation
> provides framework APIs for controller drivers to register mailboxes,
> protocol handler registration for different DOE data object types, and
> request processing with workqueues ensuring sequential handling per
> mailbox. The Discovery protocol is handled internally by the DOE core.

This looks like it is largely a duplication of drivers/pci/doe.c,
including the asynchronous request support that was originally added
but was never needed and so was clearly a mistake.

I'm wondering why the async suport is needed in the endpoint case?
Why can't this (only) be synchronous?

Thanks,

Lukas

