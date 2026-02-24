Return-Path: <linux-doc+bounces-76797-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLEoKvCwnWmgQwQAu9opvQ
	(envelope-from <linux-doc+bounces-76797-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:08:48 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B05E4188335
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50341300600F
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACC439B494;
	Tue, 24 Feb 2026 14:08:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A7241690;
	Tue, 24 Feb 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942122; cv=none; b=mWuJe07j5IJ2jMvWBVP7/HJP5YSeN+hGj29fZqpCGSqHc28txSmYwE+s43kkIZ6gKhj8ve1fOE5nFakjMDHs6XEvbf7Y82/wrAOzBEWgYsCjl9UyytCc6Gfx7nqCRuf6kULklV2eJUAQCsQqKKpttCm8IgyWIy0yWFoyEA/fBN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942122; c=relaxed/simple;
	bh=NK2ZqAtba6YlSQvgRXiZbAFmwcb4rlEkmkCuBZX1KAY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLGrlYpdbpYhco0Ru1HxOYd6oSgZudKDxb34CrIMX8v+CyB3sSnZsjuwBpSdII3J6W3hHejdJ/hOe+uyfncHseDo/DcajiYAv5r9rxsN619+/s4T1oa0cgnx4o0+1PxEyrFr7Geio6gH/iN/aWt5+uyNxE+3FATyrnJE6dYexyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 869DFB61BA;
	Tue, 24 Feb 2026 14:08:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id DC3498000E;
	Tue, 24 Feb 2026 14:08:30 +0000 (UTC)
Date: Tue, 24 Feb 2026 09:08:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v4 1/3] PCI: trace: Add PCI controller LTSSM transition
 tracepoint
Message-ID: <20260224090827.59640d90@fedora>
In-Reply-To: <1769047340-113287-2-git-send-email-shawn.lin@rock-chips.com>
References: <1769047340-113287-1-git-send-email-shawn.lin@rock-chips.com>
	<1769047340-113287-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: bk3h88dsxsjh7s8kghk3p76741uazjqo
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/2cbOBBDRNi5M66QWEdnZNku3dvrZ6FJc=
X-HE-Tag: 1771942110-983074
X-HE-Meta: U2FsdGVkX1+d24m/3WrbBq5mUOIpQbNlH8/NumQCAlhGdg4jpoF6OyrBF/QIJjAydEeCpl/YfFZ+xKLkh+340rlBaxHqIS5FWcjsdUh9STKRsNAgQ6PMfdMNAERyxr51lWiLB6q0Jx52CzyCX8f2x+6tGfomWl0vJwXxlhYyXZqN3n6qnQ+AeSn6tNrN1g8Me2huc9xk4SMKo3dKOIO3WlR7jWRSTg2qKSLoqpgSkU4HqwRFnK6NsuNFH2YElzzqEHuczVvfpR1IpU2iOBQkSEb16SOk37PH3Cy+D2EABQGVKoM13lOXA+0o1xdUU7r0LrL39V7CB4pyVhgS/0uhgWBTcTXRNLmplWVa0V/i3R+WQj23MNk+eSsdPC0Eqale
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_FROM(0.00)[bounces-76797-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rock-chips.com:email]
X-Rspamd-Queue-Id: B05E4188335
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 10:02:18 +0800
Shawn Lin <shawn.lin@rock-chips.com> wrote:

> +bool pci_ltssm_tp_enabled(void)
> +{
> +	return atomic_read(&pcie_ltssm_tp_enabled) > 0;
> +}
> +EXPORT_SYMBOL(pci_ltssm_tp_enabled);
> +
> +int pci_ltssm_tp_reg(void)
> +{
> +	atomic_inc(&pcie_ltssm_tp_enabled);
> +	return 0;
> +}
> +
> +void pci_ltssm_tp_unreg(void)
> +{
> +	atomic_dec(&pcie_ltssm_tp_enabled);
> +}

This seems totally unnecessary. Why the atomic operations? Why not just
use:

	if (trace_pcie_ltssm_state_transition_enabled()) ...

?

-- Steve

