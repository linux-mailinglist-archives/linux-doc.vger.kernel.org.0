Return-Path: <linux-doc+bounces-76796-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGH9EKGwnWmgQwQAu9opvQ
	(envelope-from <linux-doc+bounces-76796-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:07:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EE188300
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 286DC3128F43
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2777F39E6C0;
	Tue, 24 Feb 2026 14:06:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B35241690;
	Tue, 24 Feb 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941973; cv=none; b=IIiBo4qrWDSHNID6+OgIUcT1/bKxld8+GruMljHy5Nlrm9w5hZMleYfA9rhQ5TaS1vgWyXv+CKQKOvs85YXBS9+4V1QFRUvuoCfgBCuus/lXFMXpGBTBLWn/xYpWp/UEO3goQmo+wlB7Jh7WKrPkK1kHimAfw3CDTSD6rjpS+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941973; c=relaxed/simple;
	bh=xqMSKdpIP8QnYOfr/M8MAXLwDnJfPBzAsvrTMfFZpTk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHyLxK5TRme5xn61K8Jym9GGGhlohUqV19i9yam2EbNmt0AOqE7GK+DKUOO2CJNgt+/Kh+y8N6Dk17DNPa4XIU+jw24w6heivMWKZmRDwD1no03WDwPpQpX32qoJBPMP9nxX/vVcrqiPT/9b9PAxhBaXDBPE8GxZlog7NcFRPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 393A41BFE5;
	Tue, 24 Feb 2026 14:06:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id BCA961B;
	Tue, 24 Feb 2026 14:06:07 +0000 (UTC)
Date: Tue, 24 Feb 2026 09:06:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v4 0/3] PCI Controller event and LTSSM tracepoint
 support
Message-ID: <20260224090604.0465de5c@fedora>
In-Reply-To: <5549b86e-36f7-e5b2-e16c-f70e328ca6c2@rock-chips.com>
References: <1769047340-113287-1-git-send-email-shawn.lin@rock-chips.com>
	<9e06e69c-d10a-1f21-cbf7-204319549612@rock-chips.com>
	<u3es7h4mgzdqfhvpl52s3x4vcisrpazcm4qb6x7lu4srmagxpn@hca2begqypeu>
	<5549b86e-36f7-e5b2-e16c-f70e328ca6c2@rock-chips.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4cgi5uimthc3nux8ptqpfobnamrz4o68
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Yz0roP/AKiqn82g/7TrII80attliQKEg=
X-HE-Tag: 1771941967-409422
X-HE-Meta: U2FsdGVkX19fXOTQgbK7wdrf7I3YWP9WhyRJN7WbazT1DrLNl30Dj8ynmA96oQfhmzaszaa4KRv+U2ysT+aLh4HeOe9cyHMOJ6GyXybhCc6BdPZ/xhtdovK1G/aBP9nkPoMlt71F1mqj1s4EclEtU8RChufeOAvm+B4fiNkSTifSvBEVLdfSx5rzQ9G40oafavZLyXd8ocwl3bfNcTetar/gtMyusAvzsRR4iDZo2z3ZYMQ7tLLfiMqCjIHpoaFOMcJzfbCIuFXLXJXqqK3ANqfpuxGWZq1ySgKGLbOFhGc57fV1/FQalbisHftixxonmR01tFPGmB13EtNLNNmdR/QF2gPrkD2PwrWUftvdv5IDFX6YsEiWsc6KL4QGWt40imuZNpzmTzzNEbrk+Da4lw==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-76796-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email]
X-Rspamd-Queue-Id: 5D7EE188300
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 16:49:47 +0800
Shawn Lin <shawn.lin@rock-chips.com> wrote:

> I'd appreciate it if you could share any concerns you might have about 
> v4. :)

Sure. I'll reply to the patches.

-- Steve

