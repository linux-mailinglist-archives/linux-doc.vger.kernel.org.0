Return-Path: <linux-doc+bounces-89865-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFchIPQgGGocdggAu9opvQ
	(envelope-from <linux-doc+bounces-89865-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 13:03:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14E5F1064
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 13:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F6FC30297AC
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 10:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF413D523F;
	Thu, 28 May 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nStxKLPl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743B3D1ABC;
	Thu, 28 May 2026 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965840; cv=none; b=Mgu+oLDe5gHgPHEXKPN9pAOFEgHoCh4zfzVXBbIDyZu+yUh0Qm4tlAPCFxu/OQN1oGRE2LA9dJEdbFXo3N13JIsEJxKASpwnq02n+QQrd912Px2/uG+oqk2ACyuqQzEZkfYUR5hJ2b+Kto9cGi2H3BaqYoNQ1S2UJTaeOLhryRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965840; c=relaxed/simple;
	bh=9t47wUhCNNof8aIgbegXoRABZWz8Z8Ikx0BlTL06w04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avINVhZM4QQoRWlAbx0VqQzD3iDhQGR+joZrZfDZdAx3wkUNOaHvtHX1qqVCKHlQogitDiHWMdjtebKd8ZodbJ+O/XGdn1AVyJSHlsJJTOXZeW4JprIpoXbdN4L0T5JlAoGa44jtCLjyb3WjKzNIRJSAIjFdlcn1pysXfK8dex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nStxKLPl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4F91F00A3A;
	Thu, 28 May 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779965837;
	bh=9t47wUhCNNof8aIgbegXoRABZWz8Z8Ikx0BlTL06w04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nStxKLPl63L6txLgSYbTP+sOuHvI+kfP4z6UbWYSPsJiSfxZMp2fNjGO5veO3PSyo
	 XeAkphExoRlXnntuA242D+FvvTCptu2kcSVlvva7ZDH4MV5P3ztKptQgCa/FL6B5if
	 cirwL7QynGJXY/G62g/d1EG9G3So7jS9zOYQUCbmVqrLs8A40Q6rRH19sgPaz/3Zcx
	 q7ouVtdEXPYO7PD8HTwEQTg9eCt1fYAFIDaJLjXuCFz7a8kE576HMcFPCiajjQjn9Q
	 dpMV7Whlh7a5NK8++ip7Q3JtiVWjIePswSym8XYSZfIRoUm1FFNpjR29dQPt6HGdx4
	 gT0RICPCX8GPQ==
Date: Thu, 28 May 2026 11:57:12 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] arm64: hw_breakpoint: Disallow breakpoints in no
 kprobe code
Message-ID: <ahgfiNTct7d4dLPL@willie-the-truck>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
 <20260407-arm-debug-8-9-v4-1-a4864e69b0ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-arm-debug-8-9-v4-1-a4864e69b0ea@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89865-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DC14E5F1064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:29:43AM -0500, Rob Herring (Arm) wrote:
> Taking debug exceptions while manipulating the breakpoints is likely to
> be unsafe. The setting kprobes in the breakpoint code is already
> forbidden, but the setting of h/w breakpoints is not. Copy what x86 does
> and exclude breakpoints that fall within the kprobe section.

It would be good to spell this out a little more clearly, as "likely to
be unsafe" is very vague. There's also plenty of breakpoint handling
code outside of the arch backend (e.g. in kernel/events/) which doesn't
seem to be in the no-kprobes section, so it's not clear why that's ok.

Will

