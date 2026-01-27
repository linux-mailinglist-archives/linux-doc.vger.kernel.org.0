Return-Path: <linux-doc+bounces-74081-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LeAOS+LeGmqqwEAu9opvQ
	(envelope-from <linux-doc+bounces-74081-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 10:53:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327B92221
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 10:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9409305C8E7
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 09:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D732E62A9;
	Tue, 27 Jan 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubfpjJ7h"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253482E040D;
	Tue, 27 Jan 2026 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507278; cv=none; b=Y+dfH2TuYoLDFTdFhQPChIKBObytLg2PlM0aSiK0yAe0AS5MAI183ZSNrAriMH6jXxclcUhrGTix2TbsQcW4qpQcKjH9X57DYxlHTwUg1xbn+HwrqyP6KgC5ypCgOwT2biFH0vEAUmnWbytNKCwSFpYO0z/d7RXuHr0s/G8NgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507278; c=relaxed/simple;
	bh=TQl+XUnTjtRtOXjHCbKd3JXbhimpuS3lMlbUrcmWca0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQCCILqOQ5i9Mby/bAyQKrdSXYQqRdZysTtEf37k1TsGK9Wog/uSLJ1Gkr9oPGTLWLLSkh5mqvaq09yxVJCjlW8TMUaVCi1waxfzRO3zPJaj2L//LlAUeJOoCPBk19a9I4Kybvq/+f6lvF//L7uuHgBm0orTlRQcaF/kUhjAnD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubfpjJ7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB7AC116C6;
	Tue, 27 Jan 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507277;
	bh=TQl+XUnTjtRtOXjHCbKd3JXbhimpuS3lMlbUrcmWca0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubfpjJ7huxAWOL/vZ6373Nhr9wG0Ti6fd1/zGOuCcOdYlZ0LBlnJRjr3KWcfoShmm
	 TBMjslzWysN1Zoo8pwa+xlbVDJdy8SDR10hkRFDwAJV2pg1hKoe5+cV5uYk+p7kKad
	 lASJLOAbxf3rlxaRokoF+6ZMU4tHGMHGsqJvp9dFhmnY1lND+QkZk/omtE3i/k1b6i
	 kgN8JEA9YE+4zHm4OeCXyadhbDC0wil8uUuNfsdAoAHSgqjYwqKQ+7uK5UTKO+wp50
	 efZSIc5SF+t0dF1nskPoAWa4V78qN9/8FitAN1NTiPVZuo9MqOMa+2EhDLMFfRnRgq
	 aJ1mWUXRJYqJA==
Date: Tue, 27 Jan 2026 10:47:52 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Frank.Li@nxp.com,
	dlemoal@kernel.org, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] PCI: endpoint: pci-epf-test: Allow overriding default
 BAR sizes
Message-ID: <aXiJyDUSj68MLQaa@fedora>
References: <20260123180747.827357-2-cassel@kernel.org>
 <23lxq2hvynxqmothnkhjtarpklin3prv7tvjlvy3xjnzpn5kdj@ks2qay2tgzc2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23lxq2hvynxqmothnkhjtarpklin3prv7tvjlvy3xjnzpn5kdj@ks2qay2tgzc2>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74081-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5327B92221
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:44:13PM +0900, Koichiro Den wrote:
> On Fri, Jan 23, 2026 at 07:07:48PM +0100, Niklas Cassel wrote:
> > Add bar{0,1,2,3,4,5}_size attributes in configfs, so that the user is not
> > restricted to run pci-epf-test with the hardcoded BAR size values defined
> > in pci-epf-test.c.
> > 
> > This code is shamelessly more or less copy pasted from pci-epf-vntb.c
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> 
> This is useful, thanks!
> I've used this patch as a dependency for my series [1], and it works fine.
> 
> Tested-by: Koichiro Den <den@valinux.co.jp>
> 
> [1] https://lore.kernel.org/linux-pci/20260124145012.2794108-1-den@valinux.co.jp/


Thank you for testing!

Just to clarify:
Your series is currently not depending on this patch, and neither do I think
that it should.

There will be a trivial conflict when PCI maintainers will try to merge them.

But the solution is to use your new values:

-static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
+static size_t bar_size[] = { 131072, 131072, 131072, 131072, 131072, 1048576 };


With my new variable name (default_bar_size):

-static size_t bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };
+/* default BAR sizes, can be overridden by the user using configfs */
+static size_t default_bar_size[] = { 512, 512, 1024, 16384, 131072, 1048576 };


So AFAICT, it should a one line conflict resolution.

Since it is so trivial, it would be nice if the PCI maintainers could
handle that when applying, but I guess in worst case, one of us will
need to respin.


Kind regards,
Niklas

