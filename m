Return-Path: <linux-doc+bounces-75556-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP6yB7dAhmmFLQQAu9opvQ
	(envelope-from <linux-doc+bounces-75556-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 20:27:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C74102BAA
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 20:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255CC306999B
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 19:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78A63043B5;
	Fri,  6 Feb 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spbrbna5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F792EB86C;
	Fri,  6 Feb 2026 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770405766; cv=none; b=a0cMikaqxuInNdOdxIWUjVZLpncgDvqZmmME0gVVDYVpZwlTdTip1CR1+jycqNC0Ax4LbQnNHE1jS6q6W0QqiB2r+/PEj+7KXUN6ZdFNcaW8lfR33BbvPxuR1AKS8FdzD+4MwOGTWiiaN5nAOd+zGr6+8WsAAVKXQBgnKusx4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770405766; c=relaxed/simple;
	bh=Kx5wCP16pk7aUKUS5Xc0tFB0Vbdh59w+1I8LJqs55U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McpukmNN5EEJFUPQhpo/XYkLeBU4vQ7sb4IX3HH0SoQ26s7psCrCh3Burc0et6sfrZfve60Ri2T5BEyQOhIZYfz7kNPT3oQrSEQbsUF1NxGXjEbm5Su6JG9LbXnCP5jx2r73nhtgH/LMX8lmWbr/ekrRDGqGfoWo84wbfSDE1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spbrbna5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C917DC116C6;
	Fri,  6 Feb 2026 19:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770405766;
	bh=Kx5wCP16pk7aUKUS5Xc0tFB0Vbdh59w+1I8LJqs55U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spbrbna5ixWjIiDUfzkYLTPfYSHLqaWM1tapgfHoQuHb0w8yXLKcZ0NuUXaWX09mc
	 Srkbc+faDpBQkr+3X1x0jaCfz+OkN9DPzefo8+ODZ7+Y9/N6qlbExQws5bVJnS4OBK
	 sCX/+c15tp23trM6HBpYwDUlzJbHP7gqvGFu8s6cR6AO95wTNCBOeWxs8LgxLD4ZP1
	 p9mX08kUANVWoTd47pUPFYryWSoNnUNyC8N+t4hv6Ov/0oiOCGcQ8T9+/hitYkUvrr
	 TDmuTgrhjUdTNn6dyZyGqRhdryecNjbDkgQLC7ooJjmsYT9Splcu+EukfqOpN4kpJ5
	 ZZFbEM5w9Nd7A==
Date: Fri, 6 Feb 2026 12:22:44 -0700
From: Keith Busch <kbusch@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, dcostantino@meta.com, rneu@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYY_hMZyVp7GZvX2@kbusch-mbp>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206185232.GA70936@bhelgaas>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75556-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[debian.org,lwn.net,linux.ibm.com,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,meta.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kbusch@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75C74102BAA
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 12:52:32PM -0600, Bjorn Helgaas wrote:
> Just from an overall complexity point of view, I'm a little hesitant
> to add new kernel parameters because this seems like a very specific
> case.
> 
> Is there anything we could do to improve the logging to make the issue
> more recognizable?  I assume you already look for KERN_CRIT, KERN_ERR,
> etc., but it looks like the current message is just KERN_INFO.  I
> think we could make a good case for at least KERN_WARNING.
> 
> But I guess you probably want something that's just impossible to
> ignore.

It's not necessarily about improving visibility with a higher alert
level. It's more that the system can't be trusted to operate correctly
from here on. Consider an interconnected GPU setup and only one
experiences an unrecoverable error. We don't want to leave the system
limping along with this unresolved error as it can't perform anything
useful. A panic induced reboot is the least bad option to return the
system to operation, or crashes the system temporally close to failure
to get logs for the vendor if we're actively debugging.
 
> Are there any other similar flags you already use that we could
> piggy-back on?  E.g., if we raised the level to KERN_WARNING, maybe
> the existing "panic_on_warn" would be enough?

There are many KERN_WARNING messages that don't rise to the level of
warranting a 'panic' that don't want to enable such an option in
production. It looks like the panic_on_warn was introduced for developer
debugging.

I agree the curnent INFO level is too low for the generic unrecovered
condition, though.

