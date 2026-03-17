Return-Path: <linux-doc+bounces-79651-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF5gGZgKuWk/ngEAu9opvQ
	(envelope-from <linux-doc+bounces-79651-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 09:02:32 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB72A5365
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 09:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D713B301982A
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 08:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113BC392C5F;
	Tue, 17 Mar 2026 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLMVSFHj"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0257372B27;
	Tue, 17 Mar 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734535; cv=none; b=rSxxV92p0uqN2pzDQtiKgd/f0yMfYerf2PW0YD64yZgSKCuf7rv8LfGM2Rs0Ic24B+gXGAY9W49DMdoXcJI/RHBe4mf9Lq3KvoVP0afchp2oxG+wk/GLlr6RP7iTbiZFgir5S1ZYPyr3ACuduGXBIi9yijtXtfsBw9ZSgfhtv8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734535; c=relaxed/simple;
	bh=mo+aUkQ4yBYLWlSaJXUVDB86VdVqtVjyklbrcbfVFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBiL24q3R0ra4UEs9Hp3e2ZkXRFFQWC3ugV/8Vb+ZERfW7HZxDPE5yXi9sM0ty6ubiJdfaUtO0kXXilOU9GP78iMVOo81ksHkz4o3Q7MoFtyZcV7ovSuKoKv5ekMzN2xAZjcXEm3K7TITdvfYMg24mRQgOPpEJBpfmkcE3LUqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLMVSFHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2069EC4CEF7;
	Tue, 17 Mar 2026 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773734534;
	bh=mo+aUkQ4yBYLWlSaJXUVDB86VdVqtVjyklbrcbfVFPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SLMVSFHj4C/0E7Lvzq29l1ix0Jabz+EfjBj8hRlj0SZqvjfc7N5yiDncAuS7cN1az
	 cMsCa25dNVB5LMivJNjhYb2uAy0oK4kJv7t9TpASpJ88eB6ygg5jPgehJbCeVBsHui
	 /MsHYWT+s2MVaeNLE58d3t9iyrb43AZJxKZCwWQlBwelLmzw6hQb9+29cpNoYY2GKt
	 E/jInQz0nUvRrKhRiuyqsCCzT07qeMqgEzvQp6XCeG1yLRaf5kzX9nxvutHRDP44fJ
	 vc+HglD81RlW881rAs6iYAR/GwsNOuZoZwOGOQQvNcsP7NWp0OkfpwJ5NVJlrg469M
	 JsdmiTlyvtf8w==
Date: Tue, 17 Mar 2026 09:02:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v2 07/28] docs: kdoc: move C Tokenizer to c_lex module
Message-ID: <20260317090210.0d0e319b@foz.lan>
In-Reply-To: <87pl53fj2l.fsf@trenco.lwn.net>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
	<6f325ef5c6be846c21b0c4df0f48bd0deeb236b0.1773326442.git.mchehab+huawei@kernel.org>
	<87pl53fj2l.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79651-lists,linux-doc=lfdr.de,huawei];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foz.lan:mid,lwn.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EBB72A5365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 17:30:58 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Place the C tokenizer on a different module.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  tools/lib/python/kdoc/c_lex.py       | 239 +++++++++++++++++++++++++++
> >  tools/lib/python/kdoc/kdoc_parser.py |   3 +-
> >  tools/lib/python/kdoc/kdoc_re.py     | 233 --------------------------
> >  3 files changed, 241 insertions(+), 234 deletions(-)
> >  create mode 100644 tools/lib/python/kdoc/c_lex.py  
> 
> One has to ask...why not just put it in its own file in the first place?

Good question... As usual, this started simple. When complexity
increased, and, specially, when I wanted to mangle with NestedMatch,
it became clearer that placing it elsewhere would be for the best.

I can adjust it at the next respin.

> 
> Thanks,
> 
> jon



Thanks,
Mauro

