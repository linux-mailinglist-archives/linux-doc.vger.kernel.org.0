Return-Path: <linux-doc+bounces-87280-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO0LGccQBGoMDAIAu9opvQ
	(envelope-from <linux-doc+bounces-87280-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:48:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6A852DC03
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 208B5307C435
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 05:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B83A9625;
	Wed, 13 May 2026 05:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvrBSqKg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D362D6E44;
	Wed, 13 May 2026 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651296; cv=none; b=ga7/Z6EuJm5JzE37hAe4EEsl6d1xH685e2I5s6w/do5vHie632P9n6ignsqrGGv7Il/KxMYd8yA3XbbTSrUN7S9A5IcwVSVIYaLWhr4+A7MeH3zCHBSSRaHNhV2UG7cRfCV/z0L8nPmCjkRgQp6nltUuNwBovmuXS9nbNI5Wf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651296; c=relaxed/simple;
	bh=cBGaNpzOjrLclou64KUX1ybqeFK7wdauHNFSf1PsR1Q=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=THAHWbZE6+yJ61QF7PfsKEqtY2wgTqDexscZQ/tJwTHdOBwp9+AEnsuRnlFClicq+M2WJTpEV6SdO6JVPm1ppn4ybqBgRdQixaLWStC0ro2lE1Xj+U+ng6Ur4JwQjxar6h+5EB14QtyfQBOoTjJ9LTLanHCFr4ftfbOrHRCAPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvrBSqKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF24DC2BCB7;
	Wed, 13 May 2026 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651295;
	bh=cBGaNpzOjrLclou64KUX1ybqeFK7wdauHNFSf1PsR1Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=FvrBSqKg6LHmRSrUHv4ejHpdDZHLgDevXQganclK34OaLM1P3iRuLB+oWoFa/qj5R
	 Y2jnFQtkEUDesYAhw3DYf00xMiOQgLR7cgthSBrblesrfG5XXRDVtmmDxI++ZDids8
	 P3uAd6dkuG37+nUVVQZJcQjoi2KnZUNV2mr39tvW4LDwfA60lh4HqV2/E0ntVsbOJx
	 4Z3VEGQjdWMSNs7/hfimgvpQP+xseaQesR347t+FVXInUnBHhbj+8BTwftlgb5Sb5l
	 JDh7JQf8FDs3iVC+2v9LZHVx3Q3KmBHWoUf+gHr9xMHCwRXiACjnXpfXdamRMM84IU
	 O/8Q1pQ17D7cg==
Message-ID: <b013e768b881741f45fd6137c325b599@kernel.org>
Date: Wed, 13 May 2026 05:48:12 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v3 1/4] clk: add kernel docs for the core flags
In-Reply-To: <20260511-clk-docs-v3-1-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-1-ed67e1065809@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jonathan
 Corbet" <corbet@lwn.net>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: EB6A852DC03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-87280-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 21:35:04 -0400, Brian Masney wrote:
> Let's add a DOC section for the clk core flags, and move the
> documentation for each flag into the doc header so that it can
> be easily referenced in the generated kernel documentation.
> 
> Note: The comment about "Please update clk_flags..." is included as a
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

