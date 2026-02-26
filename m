Return-Path: <linux-doc+bounces-77103-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ANKImmQn2kicwQAu9opvQ
	(envelope-from <linux-doc+bounces-77103-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:14:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5219F52F
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAEE4301E6DA
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 00:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1FC13B7A3;
	Thu, 26 Feb 2026 00:14:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509C14BF97;
	Thu, 26 Feb 2026 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064869; cv=none; b=UCDUrCo/8s7jKn4052Q1Ezy5B5Z+st5CL0e00xELLXkIMs/3rcyJ+IbbL4Xiya8911Iexyo8JUkIqoLWWWAOjWNOHfo3UvNlqAOURYTE3JhGK8mFkRd4zLOfCWSCY1DrhIE1vEodjAED6t/pm32tmGaDKbjYce6fa4Bw7hjdOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064869; c=relaxed/simple;
	bh=HzgWSanUYiV8Wi6BUPvg+V46PMaO5xRpf7YcCw8co/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLKf+3j/0IGb/SnUIg+9dYniR5BPs4i/k3oZbvKZne1B759iXk5nLT1MHEkZgrE1Vpl2Z6iU5fWRLQBrbR7tNjIroEDhq2DomFWvdphQU5ikRdGwT35JeflJwtHT2PMy44e2VBXoCiJUU3uw0XbkHrijNSlCmO8R+pMvzC0G+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id EEF7D1C395;
	Thu, 26 Feb 2026 00:14:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 111131C;
	Thu, 26 Feb 2026 00:14:24 +0000 (UTC)
Date: Wed, 25 Feb 2026 19:13:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v4 3/3] PCI: dw-rockchip: Add
 pcie_ltssm_state_transition trace support
Message-ID: <20260225191342.6025c3b0@fedora>
In-Reply-To: <6177ba1f-c89e-486a-fdb5-9344c6551d72@rock-chips.com>
References: <1769047340-113287-1-git-send-email-shawn.lin@rock-chips.com>
	<1769047340-113287-4-git-send-email-shawn.lin@rock-chips.com>
	<20260224091115.6e32c38e@fedora>
	<20260224091601.48a7b3c0@fedora>
	<6177ba1f-c89e-486a-fdb5-9344c6551d72@rock-chips.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: t841fxjk1mky8pmyyp9by8w3fubijr6i
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19/dSNO991F9MDut7wN2qrCWlhj3EPOQT0=
X-HE-Tag: 1772064864-882250
X-HE-Meta: U2FsdGVkX1/HiYaZRW248n0xpLIre8UsQzpzQlA3Z8SuRsYMaqAOxcVzwJvTJ3A6lKPdhHrnHSQ7KFLJQTanN2tli/FRfY9H2UMvQuAc+qxEXXOtEfBHJ1OvMf/ZNpmzpqudM78kX4pPbU725KfKF5vxDNZMD2SahAo0vEofsKa+i0GboLDrsP3aZocfw2ryXHJQzIDPwBjs6KPVBtGWke+SUV6EUatV/wMP9KdfancbVedZ+1MtoxTy9o8hJNgXgxWT06yOdsrrSeH3BuHG4E9BWq8yg5/w8HysLsR9GBff+GNlps/5uf1yP9k21O/1N9u30p4wDn0Fq6q1g0QAgY4nxw3DuJ/xAdYiYQQE48uQpPhnr5dGAMlB0he5ty41
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
	TAGGED_FROM(0.00)[bounces-77103-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BEC5219F52F
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 09:25:16 +0800
Shawn Lin <shawn.lin@rock-chips.com> wrote:

> I must admit I borrow it from arch/powerpc/include/asm/trace.h and
> include/trace/events/i2c.h for reference, where the reg and unreg
> just increase and decrease the ref count to indicate if the tp
> should be continued. Sure, the static branch could be used instead,
> even without reg and unreg implementation.

The i2c.h looks like it should be switched over to the
trace_<tracepoint>_enabled(), but the powerpc enables a static branch
in assembly, so that one does make sense to do it the way it did it.

-- Steve

